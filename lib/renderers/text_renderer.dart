import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as UI;

import 'package:seo_renderer/helpers/utils.dart';

/// A Widget to create the HTML Tags from the TEXT widget.
class TextRenderer extends StatefulWidget implements RouteAware{
  final Text text;
  final RenderController? controller;

  const TextRenderer({Key? key, required this.text, this.controller})
      : super(key: key);

  @override
  _TextRendererState createState() => _TextRendererState();

  @override
  void didPop() {
    // TODO: implement didPop
  }

  @override
  void didPopNext() {
    // TODO: implement didPopNext
  }

  @override
  void didPush() {
    // TODO: implement didPush
  }

  @override
  void didPushNext() {
    // TODO: implement didPushNext
  }
}

class _TextRendererState extends State<TextRenderer> {
  final DivElement div = new DivElement();
  final key = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => addDivElement(context));
    widget.controller?.refresh = refresh;
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
      builder: (ctx, con) {
        return widget.text;
      },
    );
  }

  addDivElement(BuildContext context) {
    if (!regExpBots.hasMatch(window.navigator.userAgent.toString())) {
      return;
    }
    refresh();
    document.body?.insertAdjacentElement('afterEnd', div);
  }
}

///Controller class to refresh the position in case of Scrolling
class RenderController {
  late UI.VoidCallback refresh;
}
