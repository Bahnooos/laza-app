import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/app_color.dart';

import 'widgets/home_bottom_nav_bar.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.backGroundScreenColor,
      body: HomeScreenBody(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
