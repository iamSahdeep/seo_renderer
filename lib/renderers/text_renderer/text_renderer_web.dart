import 'dart:html';

import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/scroll_aware.dart';
import 'package:seo_renderer/helpers/utils.dart';

/// A Widget to create the HtmlElement Tags from the TEXT widget.
class TextRenderer extends StatefulWidget {
  /// Default [TextRenderer] const constructor.
  const TextRenderer({
    Key? key,
    required this.text,
    this.element,
  }) : super(key: key);

  /// Provide with [Widget] widget to get data from it.
  final Widget text;

  /// HtmlElement freqently use for text:
  /// - Default: new ParagraphElement()
  /// - new ParagraphElement()
  /// - new HeadingElement.h1() tp h6()
  final HtmlElement? element;

  @override
  _TextRendererState createState() =>
      _TextRendererState(element: element ?? new ParagraphElement());
}

class _TextRendererState extends State<TextRenderer>
    with RouteAware, ScrollAware {
  _TextRendererState({required this.element});

  final HtmlElement element;
  final key = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    subscribe(context);
  }

  @override
  void dispose() {
    clear();
    routeObserver.unsubscribe(this);
    unsubscribe();
    super.dispose();
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

  @override
  void didScroll() {
    refresh();
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
