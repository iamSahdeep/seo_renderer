import 'package:flutter/material.dart';

/// This VM import stub does nothing and only returns the child.
class ImageRenderer extends StatelessWidget {
  /// Default [ImageRenderer] const constructor.
  const ImageRenderer({
    Key? key,
    required this.child,
    this.src,
    required this.alt,
  }) : super(key: key);

  /// Any Widget with image in it
  final Widget child;

  /// Image source
  final String? src;

  /// Alternative to image
  final String alt;

  @override
  Widget build(BuildContext context) => child;
}
