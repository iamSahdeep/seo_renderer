// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/robot_detector_web.dart';
import 'package:seo_renderer/helpers/size_widget.dart';

/// A Widget to create the HTML Tags but with Link (href) from any [Widget].
class LinkRenderer extends StatefulWidget {
  /// Default [LinkRenderer] const constructor.
  const LinkRenderer({
    Key? key,
    required this.child,
    required this.text,
    required this.href,
  }) : super(key: key);

  ///Any Widget with link in it
  final Widget child;

  ///Anchor Text just like html, will work like a replacement to provided [child] with [href] to it.
  final String text;

  ///link to put in href
  final String href;

  @override
  _LinkRendererState createState() => _LinkRendererState();
}

class _LinkRendererState extends State<LinkRenderer> {
  Size? _size;

  @override
  Widget build(BuildContext context) {
    if (!RobotDetector.detected(context)) {
      return widget.child;
    }

    if (_size == null) {
      return SizeWidget(
        onSize: (size) => setState(() => _size = size),
        child: widget.child,
      );
    }

    final viewType = 'html-link-${widget.href}';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (_) => AnchorElement()
        ..href = widget.href
        ..text = widget.text
        ..style.margin = '0px'
        ..style.padding = '0px'
        ..style.width = '${_size!.width}px'
        ..style.height = '${_size!.height}px',
    );

    return SizedBox(
      width: _size!.width,
      height: _size!.height,
      child: Stack(
        children: [
          Positioned.fill(child: widget.child),
          Positioned.fill(child: HtmlElementView(viewType: viewType)),
        ],
      ),
    );
  }
}
