import 'package:flutter/material.dart';

class RobotDetector extends StatelessWidget {
  final Widget child;

  const RobotDetector({
    Key? key,
    bool debug = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => child;
}
