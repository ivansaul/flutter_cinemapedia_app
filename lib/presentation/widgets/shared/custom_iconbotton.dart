import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';

class CustomIconButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double borderRadius;
  final Color? color;
  final void Function()? onTap;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.child,
    this.width = 48,
    this.height = 48,
    this.borderRadius = 16,
    this.color = AppTheme.primarySoft,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        width: width,
        child: Material(
          color: color,
          child: InkWell(
            onTap: onTap,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
