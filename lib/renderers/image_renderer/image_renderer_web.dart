// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/robot_detector_web.dart';
import 'package:seo_renderer/helpers/size_widget.dart';

/// This VM import stub does nothing and only returns the child.
class ImageRenderer extends StatefulWidget {
  /// Default [ImageRenderer] const constructor.
  const ImageRenderer({
    Key? key,
    required this.child,
    required this.src,
    required this.alt,
  }) : super(key: key);

  /// Any Widget with image in it
  final Widget child;

  /// Image source
  final String src;

  /// Alternative to image
  final String alt;

  @override
  _ImageRendererState createState() => _ImageRendererState();
}

class _ImageRendererState extends State<ImageRenderer> {
  Size? _size;

  @override
  Widget build(BuildContext context) {
    if (!RobotDetector.detected(context)) {
      return widget.child;
    }

    if (_size == null) {
      return SizeWidget(
        onSize: (size) {
          if (size.isEmpty) return;
          setState(() => _size = size);
        },
        child: widget.child,
      );
    }

    final viewType = 'html-image-${widget.src}';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) => ImageElement()
        ..src = widget.src
        ..alt = widget.alt
        ..style.margin = '0px'
        ..style.padding = '0px'
        ..style.width = '${_size!.width}px'
        ..style.height = '${_size!.height}px',
    );

    return SizedBox(
      width: _size!.width,
      height: _size!.height,
      child: HtmlElementView(viewType: viewType),
    );
  }
}
