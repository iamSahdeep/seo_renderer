import 'dart:html';

import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/utils.dart';

/// A Widget to create the HTML Tags from the TEXT widget.
class TextRenderer extends StatefulWidget {
  /// Default [TextRenderer] const constructor.
  const TextRenderer({
    Key? key,
    required this.text,
    this.controller,
  }) : super(key: key);

  /// Provide with [Text] widget to get data from it.
  final Text text;

  /// Controller to refresh position in any case you want.
  final RenderController? controller;

  @override
  _TextRendererState createState() => _TextRendererState();
}

class _TextRendererState extends State<TextRenderer> with RouteAware {
  final DivElement div = new DivElement();
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
  }

  @override
  void didPop() {
    clear();
    super.didPop();
  }

  @override
  void didPush() {
    addDivElement();
    super.didPush();
  }

  @override
  void didPopNext() {
    addDivElement();
    super.didPopNext();
  }

  @override
  void didPushNext() {
    clear();
    super.didPushNext();
  }

  void refresh() {
    div.style.position = 'absolute';
    div.style.top = '${key.globalPaintBounds?.top ?? 0}px';
    div.style.left = '${key.globalPaintBounds?.left ?? 0}px';
    div.style.width = '${key.globalPaintBounds?.width ?? 100}px';
    div.text = widget.text.data.toString();
    div.style.color = '#ff0000';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        key: key,
        builder: (_, __) {
          return widget.text;
        });
  }

  addDivElement() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (!regExpBots.hasMatch(window.navigator.userAgent.toString())) {
        return;
      }
      refresh();
      if (!document.body!.contains(div)) document.body?.append(div);
    });
  }

  void clear() {
    div.remove();
  }
}
