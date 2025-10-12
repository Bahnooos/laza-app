import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/networking/api_result.dart';
import 'package:laza_app/features/home/presentation/logic/cubit/home_state.dart';

import '../../../data/models/products_model.dart';
import '../../../data/repos/home_repo_impl.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepoImpl) : super(HomeInitial());
  final HomeRepoImpl _homeRepoImpl;

  int page = 1;
  int pageSize = 10;
  final List<ProductItem> _allProducts = [];
  bool hasMore = true;

  Future<void> emitCategoriesState() async {
    emit(HomeCategoriesLoading());
    final categoriesResponse = await _homeRepoImpl.getCategories();
    categoriesResponse.when(
      success: (categories) => emit(HomeCategoriesSuccess(categories)),
      failure: (error) =>
          emit(HomeCategoriesError(errorMessage: error.message)),
    );
  }

  Future<void> emitProductsStates() async {
    final currentState = state;
    if (currentState is HomeProductsSuccess && currentState.hasReachedMax) {
      return;
    }
    if (!hasMore) {
      page = 1;
      pageSize = 10;
      hasMore = true;
      emit(HomeProductsLoading());
    }

    final response = await _homeRepoImpl.getProducts(
      page: page,
      pageSize: pageSize,
    );
    response.when(
      success: (newProducts) {
        final bool hasReachedMax = newProducts.isEmpty;
        if (newProducts.isEmpty) {
          hasMore = false;
        } else {
          _allProducts.addAll(newProducts);
          page++;
          pageSize += pageSize;
        }

        emit(
          HomeProductsSuccess(
            data: List.from(_allProducts),
            hasReachedMax: hasReachedMax,
          ),
        );
      },
      failure: (errorMessage) =>
          emit(HomeProductsError(errorMessage: errorMessage.message)),
    );
  }
}
