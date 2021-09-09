import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/utils.dart';

/// A Widget to create the HTML Tags but with Link (href) from any [Widget].
///
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

  ///Any Widget with link in it
  final Widget child;

  ///Anchor Text just like html, will work like a replacement to
  ///provided [child] with [link] to it.
  final String link;

  ///link to put in href
  final String alt;

  ///Optional : [RenderController] object if you want to perform certain actions.
  final RenderController? controller;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
