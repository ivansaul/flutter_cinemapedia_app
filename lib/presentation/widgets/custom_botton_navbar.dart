import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const Color selectedColor = AppTheme.primaryBlueAccent;
    const Color unselectedColor = AppTheme.textColorGrey;

    return StylishBottomBar(
      backgroundColor: AppTheme.primaryDark,
      elevation: 0,
      option: BubbleBarOptions(
        inkEffect: false,
        padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
        borderRadius: BorderRadius.circular(16),
        barStyle: BubbleBarStyle.horizotnal,
        bubbleFillStyle: BubbleFillStyle.fill,
        opacity: 1,
      ),
      items: [
        BottomBarItem(
          selectedIcon: const Icon(Icons.home_max, color: selectedColor),
          icon: const Icon(Icons.home_max, color: unselectedColor),
          title: Text(
            'Home',
            style: AppTheme.h6Medium.copyWith(color: selectedColor),
          ),
          backgroundColor: AppTheme.primarySoft,
        ),
        BottomBarItem(
          selectedIcon: const Icon(Icons.search_rounded, color: selectedColor),
          icon: const Icon(Icons.search_rounded, color: unselectedColor),
          title: Text(
            'Search',
            style: AppTheme.h6Medium.copyWith(color: selectedColor),
          ),
          backgroundColor: AppTheme.primarySoft,
        ),
        BottomBarItem(
          selectedIcon: const Icon(Icons.settings, color: selectedColor),
          icon: const Icon(Icons.settings, color: unselectedColor),
          title: Text(
            'Home',
            style: AppTheme.h6Medium.copyWith(color: selectedColor),
          ),
          backgroundColor: AppTheme.primarySoft,
        ),
      ],
      hasNotch: true,
      currentIndex: currentIndex,
      onTap: (index) {
        print(index);
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
