import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';

class CustomSearchWidget extends StatelessWidget {
  final IconData leading;
  final IconData action;
  final String hintText;
  final VoidCallback? onPressedLeading;
  final VoidCallback? onPressedAction;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;

  final EdgeInsetsGeometry padding;
  const CustomSearchWidget({
    this.onPressedLeading,
    this.onPressedAction,
    this.onChanged,
    this.leading = Icons.search,
    this.action = Icons.clear_rounded,
    this.hintText = 'Search a movie ...',
    this.padding = const EdgeInsets.all(24.0),
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 1, bottom: 1),
        height: 41,
        decoration: BoxDecoration(
          color: AppTheme.primarySoft,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: onPressedLeading,
              icon: Icon(
                leading,
                color: AppTheme.textColorGrey,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style:
                    AppTheme.h5Medium.copyWith(color: AppTheme.textColorGrey),
                cursorColor: AppTheme.textColorGrey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle:
                      AppTheme.h5Medium.copyWith(color: AppTheme.textColorGrey),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 2,
              height: 18,
              color: AppTheme.textColorGrey,
            ),
            IconButton(
              onPressed: onPressedAction,
              icon: Icon(
                action,
                color: AppTheme.textColorDarkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
