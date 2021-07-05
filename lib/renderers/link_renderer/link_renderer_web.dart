import 'dart:html';

import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/utils.dart';

/// A Widget to create the HTML Tags but with Link (href) from any [Widget].
class LinkRenderer extends StatefulWidget {
  /// Default [LinkRenderer] const constructor.
  const LinkRenderer({
    Key? key,
    this.controller,
    required this.child,
    required this.anchorText,
    required this.link,
  }) : super(key: key);

  ///Any Widget with link in it
  final Widget child;

  ///Anchor Text just like html, will work like a replacement to provided [child] with [link] to it.
  final String anchorText;

  ///link to put in href
  final String link;

  ///Optional : [RenderController] object if you want to perform certain actions.
  final RenderController? controller;

  @override
  _LinkRendererState createState() => _LinkRendererState();
}

class _LinkRendererState extends State<LinkRenderer> with RouteAware {
  final DivElement div = DivElement();
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
    div.style.color = '#ff0000';
    var anchorElement = new AnchorElement()
      ..href = widget.link
      ..text = widget.anchorText;
    div.children.removeWhere((element) => true);
    div.append(anchorElement);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        key: key,
        builder: (_, __) {
          return widget.child;
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
