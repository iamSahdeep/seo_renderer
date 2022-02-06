import 'package:flutter/material.dart';

/// A Widget to create the HTML Tags from the TEXT widget.
///
/// This VM import stub does nothing and only returns the Text.
class TextRenderer extends StatelessWidget {
  /// Default [TextRenderer] const constructor.
  const TextRenderer({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// Provide with [Text] widget to get data from it.
  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
