import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/features/home/data/models/home_categories_model.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/styles.dart';

class BrandItme extends StatelessWidget {
  final Categories _categories;
  const BrandItme(this._categories, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12.r),
        ),
        color: AppColor.ghostWhite,
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8.r),
              ),
              color: AppColor.white,
            ),
            child: Image.network(
              _categories.coverPictureUrl ?? '',
              width: 17.w,
              height: 22.h,
              color: AppColor.darkGrayColor,
            ),
          ),
          4.horizontalSpace,
          Text(_categories.name??'', style: AppTextStyles.font15GrayRegular),
        ],
      ),
 
    );
  }
}
