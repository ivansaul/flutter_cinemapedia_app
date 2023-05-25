import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewerScreen extends StatelessWidget {
  final String url;
  const ImageViewerScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: Stack(
        children: [
          Hero(
            tag: url,
            child: PhotoView(
              backgroundDecoration:
                  const BoxDecoration(color: AppTheme.primaryDark),
              imageProvider: NetworkImage(url),
            ),
          ),
        ],
      ),
    );
  }
}
