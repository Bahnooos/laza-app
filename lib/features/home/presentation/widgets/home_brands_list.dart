import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:laza_app/features/home/presentation/logic/cubit/home_state.dart';
import 'package:laza_app/features/home/presentation/widgets/brand_item.dart';

class HomeBrandsList extends StatelessWidget {
  const HomeBrandsList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state) {
          case HomeLoading():
            return CircularProgressIndicator();

          case HomeCategoriesSuccess(data: final categories):
            return HomeCategoriesSuccessBody(categories: categories);

          case HomeCategoriesError(errorMessage: final errorMessage):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage ?? 'An unknown error occurred.'),
                backgroundColor: Colors.red,
              ),
            );
          default:
        }
        return SizedBox.shrink();
      },
    );
  }
}

class HomeCategoriesSuccessBody extends StatelessWidget {
  const HomeCategoriesSuccessBody({super.key, required this.categories});

  final dynamic categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,

        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: BrandItme(categories[index]),
        ),
      ),
    );
  }
}
