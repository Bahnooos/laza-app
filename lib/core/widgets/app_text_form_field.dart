import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/theme/app_color.dart';
import 'package:laza_app/core/theme/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final String? label;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.label,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      decoration: InputDecoration(
        label: Text(label ??'' ,style: AppTextStyles.font15GrayRegular,),
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder:
            focusedBorder ??
            UnderlineInputBorder(
              borderSide: const BorderSide(color: AppColor.gray, width: .3),
            ),

        enabledBorder:
            enabledBorder ??
            UnderlineInputBorder(
              borderSide: const BorderSide(color: AppColor.gray, width: .5),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: hintStyle ?? AppTextStyles.font15GrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? AppColor.backGroundScreenColor,
        filled: true,
      ),
      validator: (value) => validator(value),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.font15GrayRegular.copyWith(
        color: AppColor.darkGrayColor,
      ),
    );
  }
}
