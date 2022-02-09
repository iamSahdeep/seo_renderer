import 'package:flutter/material.dart';

class RendererScrollListener extends StatelessWidget {
  final Widget child;

  const RendererScrollListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
