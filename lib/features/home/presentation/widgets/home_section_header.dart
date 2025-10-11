import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/app_color.dart';
import 'package:laza_app/core/theme/styles.dart';

class HomeSectionHeader extends StatelessWidget {
  final String title;
  const HomeSectionHeader({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.font17WhiteMedium.copyWith(
            color: AppColor.darkGrayColor,
          ),
        ),
        Text('View All', style: AppTextStyles.font13GrayRegular),
      ],
    );
  }
}
