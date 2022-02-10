// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/robot_detector_web.dart';
import 'package:seo_renderer/helpers/size_widget.dart';

/// A Widget to create the HtmlElement Tags from the TEXT widget.
class TextRenderer extends StatefulWidget {
  /// Default [TextRenderer] const constructor.
  const TextRenderer({
    Key? key,
    required this.child,
    this.element,
  }) : super(key: key);

  /// Provide with [Widget] widget to get data from it.
  final Widget child;

  /// HtmlElement freqently use for text:
  /// - Default: new ParagraphElement()
  /// - new ParagraphElement()
  /// - new HeadingElement.h1() tp h6()
  final HtmlElement? element;

  @override
  _TextRendererState createState() => _TextRendererState();
}

class _TextRendererState extends State<TextRenderer> {
  Size? _size;

  void _onSize(Size size) {
    if (_size == size) return;
    _size = size;

    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!RobotDetector.detected(context)) {
      return widget.child;
    }

    final text = _getTextFromWidget();
    final viewType = 'html-text-$text';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (_) => ParagraphElement()
        ..text = text
        ..style.fontSize = '14px'
        ..style.color = '#ff0000'
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

  String? _getTextFromWidget() {
    if (widget.child is Text) {
      Text wid = (widget.child as Text);
      String? data;
      data = wid.data;
      if (data != null) {
        return data;
      }
      if (wid.textSpan != null) {
        data = wid.textSpan!.toPlainText();
      }
      if (data != null) {
        return data;
      }
    }
    if (widget.child is RichText) {
      return (widget.child as RichText).text.toPlainText();
    }

    throw FlutterError(
        'Provided Widget is of Type ${widget.child.runtimeType}. Only supported widget is Text & RichText.');
  }
}
