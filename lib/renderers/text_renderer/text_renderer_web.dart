import 'dart:html';

import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/utils.dart';

/// A Widget to create the HtmlElement Tags from the TEXT widget.
class TextRenderer extends StatefulWidget {
  /// Default [TextRenderer] const constructor.
  const TextRenderer({
    Key? key,
    required this.element,
    required this.text,
    this.controller,
  }) : super(key: key);

  /// Provide with [Widget] widget to get data from it.
  final Widget text;

  /// HtmlElement freqently use for text:
  /// - new ParagraphElement()
  /// - new HeadingElement.h1() tp h6()
  final HtmlElement element;

  /// Controller to refresh position in any case you want.
  final RenderController? controller;

  @override
  _TextRendererState createState() => _TextRendererState(element: element);
}

class _TextRendererState extends State<TextRenderer> with RouteAware {
  _TextRendererState({required this.element});

  final HtmlElement element;
  final key = GlobalKey();

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    clear();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.controller?.refresh = refresh;
    widget.controller?.clear = clear;
  }

  @override
  void didPop() {
    clear();
    super.didPop();
  }

  @override
  void didPush() {
    addElement();
    super.didPush();
  }

  @override
  void didPopNext() {
    addElement();
    super.didPopNext();
  }

  @override
  void didPushNext() {
    clear();
    super.didPushNext();
  }

  void refresh() {
    element.style.position = 'absolute';
    element.style.fontSize = '14px';
    element.style.top = '${key.globalPaintBounds?.top ?? 0}px';
    element.style.left = '${key.globalPaintBounds?.left ?? 0}px';
    element.style.width = '${key.globalPaintBounds?.width ?? 100}px';
    element.style.margin = '0px';
    element.style.padding = '0px';
    element.text = _getTextFromWidget().toString();
    element.style.color = '#ff0000';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        key: key,
        builder: (_, __) {
          return widget.text;
        });
  }

  addElement() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (!regExpBots.hasMatch(window.navigator.userAgent.toString())) {
        return;
      }
      refresh();
      if (!document.body!.contains(element)) document.body?.append(element);
    });
  }

  void clear() {
    element.remove();
  }

  String? _getTextFromWidget() {
    if (widget.text is Text) {
      Text wid = (widget.text as Text);
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
    if (widget.text is RichText) {
      return (widget.text as RichText).text.toPlainText();
    }

    throw FlutterError(
        'Provided Widget is of Type ${widget.text.runtimeType}. Only supported widget is Text & RichText.');
  }
}
