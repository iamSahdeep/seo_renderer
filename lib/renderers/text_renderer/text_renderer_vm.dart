import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/utils.dart';

/// A Widget to create the HTML Tags from the TEXT widget.
///
/// This VM import stub does nothing and only returns the Text.
class TextRenderer extends StatelessWidget {
  /// Default [TextRenderer] const constructor.
  const TextRenderer({
    Key? key,
    required this.text,
    this.controller,
  }) : super(key: key);

  /// Provide with [Text] widget to get data from it.
  final Widget text;

  /// Controller to refresh position in any case you want.
  final RenderController? controller;

  @override
  Widget build(BuildContext context) {
    return text;
  }
}
