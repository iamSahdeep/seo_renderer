import 'dart:html';

import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/utils.dart';

/// A Widget to create the HTML Tags but with Link (href) from any [Widget].
class LinkRenderer extends StatefulWidget {
  ///Any Widget with link in it
  final Widget child;

  ///Anchor Text just like html, will work like a replacement to provided [child] with [link] to it.
  final String anchorText;

  ///link to put in href
  final String link;

  ///Optional : [RenderController] object if you want to perform certain actions.
  final RenderController? controller;

  const LinkRenderer(
      {Key? key,
      this.controller,
      required this.child,
      required this.anchorText,
      required this.link})
      : super(key: key);

  @override
  _LinkRendererState createState() => _LinkRendererState();
}

class _LinkRendererState extends State<LinkRenderer> with RouteAware {
  final DivElement div = DivElement();
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
        ?.addPostFrameCallback((_) => _addDivElement(context));
    widget.controller?.refresh = refresh;
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
    div.children.add(anchorElement);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: key,
      builder: (ctx, con) {
        return widget.child;
      },
    );
  }

  _addDivElement(BuildContext context) {
    if (!regExpBots.hasMatch(window.navigator.userAgent.toString())) {
      return;
    }
    refresh();
    document.body?.insertAdjacentElement('afterEnd', div);
  }

  @override
  void didPop() {
    clearTags();
  }

  void clearTags() {
    div.remove();
  }
}
