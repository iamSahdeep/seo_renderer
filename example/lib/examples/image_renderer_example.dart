import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer.dart';

class ImageRendererExample extends StatelessWidget {
  const ImageRendererExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ImageRenderer(
            alt: 'Flutter logo',
            link:
                'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
            child: Image.network(
                "https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png")),
      ),
    );
  }
}
