import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageRenderer(
      alt: 'Fake Image',
      child: Image.network('https://fakeimg.pl/300x300/?text=Image'),
    );
  }
}
