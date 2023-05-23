import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: Center(
        child: CircularProgressIndicator(
          color: AppTheme.primaryBlueAccent,
        ),
      ),
    );
  }
}
