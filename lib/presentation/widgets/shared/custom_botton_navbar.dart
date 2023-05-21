import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
          bottom: 16,
        ),
        child: GNav(
          tabBorderRadius: 16,
          backgroundColor: AppTheme.primaryDark,
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 5,
          curve: Curves.linear,
          color: AppTheme.textColorGrey,
          activeColor: AppTheme.primaryBlueAccent,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: AppTheme.primarySoft,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
          selectedIndex: 0,
          onTabChange: (index) {
            // setState(() {
            //   _selectedIndex = index;
            // });
          },
        ),
      ),
    );
  }
}
