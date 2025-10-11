import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/app_color.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.mainBlueColor,
      unselectedItemColor: AppColor.gray,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
