import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

/// A Widget to create the HTML Tags from the TEXT widget.
///
/// This VM import stub does nothing and only returns the Text.
class TextRenderer extends StatelessWidget {
  /// Default [TextRenderer] const constructor.
  const TextRenderer({
    Key? key,
    required this.child,
    this.text,
    this.style,
  }) : super(key: key);

  ///Any Widget with text in it
  final Widget child;

  ///Text that the child contains
  final String? text;

  final TextRendererStyle? style;

  @override
  Widget build(BuildContext context) => child;
}
