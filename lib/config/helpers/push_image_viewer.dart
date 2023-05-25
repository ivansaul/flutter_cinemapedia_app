import 'package:flutter/material.dart';

import '../../presentation/screens/screens.dart';

class ImageViewer {
  static void push(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewerScreen(url: url),
      ),
    );
  }
}
