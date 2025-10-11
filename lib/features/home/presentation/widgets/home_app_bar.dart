import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/app_color.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu, color: AppColor.darkGrayColor, size: 32),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColor.ghostWhite,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            Icons.shopping_bag_outlined,
            color: AppColor.darkGrayColor,
            size: 28,
          ),
        ),
      ],
    );
  }
}
