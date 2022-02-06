// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';

class RobotDetector extends StatefulWidget {
  final bool debug;
  final Widget child;

  const RobotDetector({
    Key? key,
    this.debug = false,
    required this.child,
  }) : super(key: key);

  @override
  _RobotDetectorState createState() => _RobotDetectorState();

  static bool detected(BuildContext context) {
    return context.findAncestorStateOfType<_RobotDetectorState>()!._detected;
  }
}

class _RobotDetectorState extends State<RobotDetector> {
  /// Regex to detect Crawler for Search Engines
  final _regExp = RegExp(r'/bot|google|baidu|bing|msn|teoma|slurp|yandex/i');
  late bool _detected;

  @override
  void initState() {
    super.initState();
    _detected =
        widget.debug || _regExp.hasMatch(window.navigator.userAgent.toString());
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
