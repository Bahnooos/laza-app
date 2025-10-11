import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/theme/app_color.dart';
import 'package:laza_app/core/theme/font_weight_helper.dart';

class AppTextStyles {
  static TextStyle font28BlackBold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );
  static TextStyle font15GrayRegular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.gray,
  );
  static TextStyle font11DarkGrayRegular = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.darkGrayColor,
  );
  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.gray,
  );
  static TextStyle font17WhiteMedium = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.white,
  );
}
