import 'package:laza_app/core/networking/api_errror_handler.dart';
import 'package:laza_app/core/networking/api_result.dart';
import 'package:laza_app/core/networking/api_service.dart';
import 'package:laza_app/features/home/data/models/home_categories_model.dart';
import 'package:laza_app/features/home/data/models/products_model.dart';

class HomeRepoImpl {
  final ApiService _apiService;

  const HomeRepoImpl(this._apiService);
  Future<ApiResult<List<Categories>>> getCategories() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      final categoriesResponse = await _apiService.getCategories();
      return ApiResult.success(categoriesResponse.categories ?? []);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ProductItem>>> getProducts({
    required int page,
    required int pageSize,
  }) async {
    try {
      final productResponse = await _apiService.getProducts(page, pageSize);
      return ApiResult.success(productResponse.items ?? []);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
