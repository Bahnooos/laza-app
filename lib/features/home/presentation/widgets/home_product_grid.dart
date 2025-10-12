import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/theme/app_color.dart';
import 'package:laza_app/core/theme/styles.dart';
import 'package:laza_app/features/home/data/models/products_model.dart';
import 'package:laza_app/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:laza_app/features/home/presentation/logic/cubit/home_state.dart';

class HomeProductGrid extends StatefulWidget {
  const HomeProductGrid({super.key});

  @override
  State<HomeProductGrid> createState() => _HomeProductGridState();
}

class _HomeProductGridState extends State<HomeProductGrid> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().emitProductsStates();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<HomeCubit>().emitProductsStates();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeProductsLoading ||
          current is HomeProductsSuccess ||
          current is HomeProductsError,
      builder: (context, state) {
        switch (state) {
          case HomeProductsLoading():
            return CircularProgressIndicator();

          case HomeProductsSuccess(data: final products):
            return GridView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? products.length
                  : products.length + 1,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                if (index >= products.length) {
                  return Center(child: CircularProgressIndicator());
                }
                return ProductCard(productItem: products[index]);
              },
            );
          case HomeProductsError(errorMessage: final errorMessage):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage ?? 'An unknown error occurred.'),
                backgroundColor: Colors.red,
              ),
            );

            break;
          default:
        }
        return SizedBox.shrink();
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productItem});
  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    final originalUrl = productItem.coverPictureUrl ?? '';
    final cleanedUrl = originalUrl.replaceAll(RegExp(r'\s+'), '');
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.85,
              child: Container(
                width: 160.w,
                height: 203.h,
                decoration: BoxDecoration(
                  color: AppColor.ghostWhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: cleanedUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    fit: BoxFit.cover,
                  ),
                ), // Placeholder
              ),
            ),
            4.verticalSpace,
            Text(
              productItem.description ?? '',
              style: AppTextStyles.font11DarkGrayRegular,
              maxLines: 2,
            ),

            Text(
              ' ${productItem.price ?? 0.0}',
              style: AppTextStyles.font11DarkGrayRegular.copyWith(height: 1.3),
            ),
          ],
        ),
      ),
    );
  }
}
