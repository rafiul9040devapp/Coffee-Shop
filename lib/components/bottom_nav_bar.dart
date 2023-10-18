import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      onTabChange: (value) => onTabChange!(value),
      color: Colors.grey.shade400,
      mainAxisAlignment: MainAxisAlignment.center,
      activeColor: Colors.grey.shade700,
      tabBackgroundColor: Colors.grey.shade300,
      tabBorderRadius: 24,
      tabActiveBorder: Border.all(color: Colors.white),
      tabs: const [
        GButton(
          icon: Icons.home,
          text: "Shop",
        ),
        GButton(
          icon: Icons.shopping_bag_outlined,
          text: "Cart",
        ),
      ],
    );
  }
}
