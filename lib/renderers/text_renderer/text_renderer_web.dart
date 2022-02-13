// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/robot_detector_web.dart';
import 'package:seo_renderer/helpers/size_widget.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

/// A Widget to create the HtmlElement Tags from the TEXT widget.
class TextRenderer extends StatefulWidget {
  /// Default [TextRenderer] const constructor.
  const TextRenderer({
    Key? key,
    required this.child,
    this.text,
    this.style,
  }) : super(key: key);

  ///Any Widget with text in it
  final Widget child;

  ///Text that the child contains
  final String? text;

  final TextRendererStyle? style;

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

  HtmlElement get _htmlElement {
    switch (widget.style) {
      case TextRendererStyle.header1:
        return HeadingElement.h1();
      case TextRendererStyle.header2:
        return HeadingElement.h2();
      case TextRendererStyle.header3:
        return HeadingElement.h3();
      case TextRendererStyle.header4:
        return HeadingElement.h4();
      case TextRendererStyle.header5:
        return HeadingElement.h5();
      case TextRendererStyle.header6:
        return HeadingElement.h6();
      case TextRendererStyle.paragraph:
      default:
        return ParagraphElement();
    }
  }

  String get _text {
    final text = widget.text;
    if (text != null) {
      return text;
    }

    final child = widget.child;
    if (child is Text) {
      final text = child.data ?? child.textSpan?.toPlainText();

      if (text == null) {
        throw FlutterError(
          'TextRenderer child is ${widget.child.runtimeType} and data, textSpan are null',
        );
      }

      return text;
    }

    if (child is RichText) {
      return child.text.toPlainText();
    }

    throw FlutterError(
      'TextRenderer child is ${widget.child.runtimeType} and text is null',
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!RobotDetector.detected(context)) {
      return widget.child;
    }

    final viewType = 'html-text-$_text';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (_) => _htmlElement
        ..text = _text
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
}
