// ignore: avoid_web_libraries_in_flutter
import 'dart:convert';
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
    this.src,
    required this.alt,
  }) : super(key: key);

  /// Any Widget with image in it
  final Widget child;

  /// Image source
  final String? src;

  /// Alternative to image
  final String alt;

  @override
  _ImageRendererState createState() => _ImageRendererState();
}

class _ImageRendererState extends State<ImageRenderer> {
  Size? _size;

  void _onSize(Size size) {
    if (_size == size) return;
    if (size.isEmpty) return;
    _size = size;

    if (!mounted) return;
    setState(() {});
  }

  String get _src {
    final src = widget.src;
    if (src != null) {
      return src;
    }

    final child = widget.child;
    if (child is Image) {
      final image = (child.image is ResizeImage)
          ? (child.image as ResizeImage).imageProvider
          : child.image;

      if (image is NetworkImage) {
        return image.url;
      } else if (image is AssetImage) {
        return image.assetName;
      } else if (image is ExactAssetImage) {
        return image.assetName;
      } else if (image is MemoryImage) {
        return 'data:image/png;base64,${base64Encode(image.bytes)}';
      }

      throw FlutterError(
        'ImageRenderer child is ${widget.child.runtimeType}, image is ${image.runtimeType} not supported',
      );
    }

    throw FlutterError(
      'ImageRenderer child is ${widget.child.runtimeType} and src is null',
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!RobotDetector.detected(context)) {
      return widget.child;
    }

    final viewType = 'html-image-$_src';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) => ImageElement(src: _src)
        ..alt = widget.alt
        ..style.margin = '0px'
        ..style.padding = '0px'
        ..style.width = '${_size?.width ?? 0}px'
        ..style.height = '${_size?.height ?? 0}px',
    );

    return SizedBox(
      width: _size?.width,
      height: _size?.height,
      child: Stack(
        children: [
          SizeWidget(
            onSize: _onSize,
            child: widget.child,
          ),
          if (_size != null)
            AbsorbPointer(
              child: HtmlElementView(viewType: viewType),
            ),
        ],
      ),
    );
  }
}
