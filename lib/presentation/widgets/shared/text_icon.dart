import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';

class TextIcon extends StatelessWidget {
  final IconData iconData;
  final String content;
  final Color? iconColor;
  final Color? contentColor;

  const TextIcon({
    Key? key,
    required this.iconData,
    required this.content,
    this.iconColor = AppTheme.textColorGrey,
    this.contentColor = AppTheme.textColorGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: iconColor,
          size: 15,
        ),
        const SizedBox(width: 3),
        Text(
          content,
          style: AppTheme.h6Medium.copyWith(
            color: contentColor,
          ),
        )
      ],
    );
  }
}
