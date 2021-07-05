import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/utils.dart';

/// A Widget to create the HTML Tags but with Link (href) from any [Widget].
///
/// This VM import stub does nothing and only returns the child.
class LinkRenderer extends StatelessWidget {
  /// Default [LinkRenderer] const constructor.
  const LinkRenderer({
    Key? key,
    this.controller,
    required this.child,
    required this.anchorText,
    required this.link,
  }) : super(key: key);

  ///Any Widget with link in it
  final Widget child;

  ///Anchor Text just like html, will work like a replacement to
  ///provided [child] with [link] to it.
  final String anchorText;

  ///link to put in href
  final String link;

  ///Optional : [RenderController] object if you want to perform certain actions.
  final RenderController? controller;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
