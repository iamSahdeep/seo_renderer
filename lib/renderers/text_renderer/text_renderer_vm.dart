import 'package:flutter/material.dart';

/// A Widget to create the HTML Tags from the TEXT widget.
///
/// This VM import stub does nothing and only returns the Text.
class TextRenderer extends StatelessWidget {
  /// Default [TextRenderer] const constructor.
  const TextRenderer({
    Key? key,
    required this.text,
  }) : super(key: key);

  /// Provide with [Text] widget to get data from it.
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return text;
  }
}
