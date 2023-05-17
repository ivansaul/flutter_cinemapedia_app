import 'dart:io';
import 'dart:ui';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/config/router/app_router.dart';
import 'package:flutter_template/config/theme/app_theme.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    tools: [
      ...DevicePreview.defaultTools,
      DevicePreviewScreenshot(
        onScreenshot: screenshotAsFiles(Directory('/home/saul/Pictures/')),
      ),
    ],
    builder: (context) => const ProviderScope(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Material App',
      theme: AppTheme().getTheme(),
    );
  }
}
