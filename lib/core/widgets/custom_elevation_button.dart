import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/theme/app_color.dart';
import 'package:laza_app/core/theme/styles.dart';

class CustomElevationButton extends StatelessWidget {
  const CustomElevationButton({super.key,required this.onPressed, required this.label});
  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColor.mainBlueColor),
        fixedSize: WidgetStateProperty.all(Size(double.infinity, 50.h)),
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 30.h)),
      ),
      onPressed: onPressed,
      child: Text(label, style: AppTextStyles.font17WhiteMedium),
    );
  }
}
