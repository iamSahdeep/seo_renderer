import 'dart:html';
import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/utils.dart';

/// A Widget to create the HTML Tags from the TEXT widget.
class TextRenderer extends StatefulWidget {
  /// Provide with [Text] widget to get data from it.
  final Text text;

  /// Controller to refresh position in any case you want.
  final RenderController? controller;

  const TextRenderer({Key? key, required this.text, this.controller})
      : super(key: key);

  @override
  _TextRendererState createState() => _TextRendererState();
}

class _TextRendererState extends State<TextRenderer> with RouteAware {
  final DivElement div = new DivElement();
  final key = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

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
    document.body?.append(div);
  }

  @override
  void didPush() {
    clearTags();
  }

  void clearTags() {
    div.remove();
  }

  @override
  void didPop() {
    clearTags();
  }
}
