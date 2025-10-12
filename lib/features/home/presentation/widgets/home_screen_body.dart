import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/theme/styles.dart';
import 'package:laza_app/core/widgets/custome_app_bar.dart';
import 'package:laza_app/features/home/presentation/widgets/home_product_grid.dart';

import '../../../../core/helpers/strings.dart';
import 'home_brands_list.dart';
import 'home_search_bar.dart';
import 'home_section_header.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            const CustomeAppBar(hasWishlistIcon: false),
            Text(AppStrings.hello, style: AppTextStyles.font28BlackBold),
            Text(
              AppStrings.welcomeToLaza,
              style: AppTextStyles.font15GrayRegular,
            ),
            const HomeSearchBar(),
            const HomeSectionHeader(title: 'Choose Brand'),
            const HomeBrandsList(),
            4.verticalSpace,
             const HomeSectionHeader(title: 'New Arrival'),
            Expanded(child: const HomeProductGrid()),
            // verticalSpace(32),
          ],
        ),
      ),
    );
  }
}
