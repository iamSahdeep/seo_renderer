import 'package:flutter/material.dart';

/// A Widget to create the HTML Tags but with Link (href) from any [Widget].
///
/// This VM import stub does nothing and only returns the child.
class LinkRenderer extends StatelessWidget {
  /// Default [LinkRenderer] const constructor.
  const LinkRenderer({
    Key? key,
    required this.child,
    required this.text,
    required this.href,
  }) : super(key: key);

  ///Any Widget with link in it
  final Widget child;

  ///Anchor Text just like html, will work like a replacement to
  ///provided [child] with [href] to it.
  final String text;

  ///link to put in href
  final String href;

  @override
  Widget build(BuildContext context) => child;
}
