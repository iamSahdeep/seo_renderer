import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/utils.dart';

/// This VM import stub does nothing and only returns the child.
class ImageRenderer extends StatelessWidget {
  /// Default [ImageRenderer] const constructor.
  const ImageRenderer({
    Key? key,
    this.controller,
    required this.child,
    required this.link,
    required this.alt,
  }) : super(key: key);

  ///Any Widget with image in it
  final Widget child;

  ///Image source
  final String link;

  ///Alternative to image
  final String alt;

  ///Optional : [RenderController] object if you want to perform certain actions.
  final RenderController? controller;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
