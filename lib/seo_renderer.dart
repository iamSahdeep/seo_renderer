import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as UI;

RegExp _regExp = RegExp(r'/bot|google|baidu|bing|msn|teoma|slurp|yandex/i');

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      return renderObject!.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}

class SeoRenderer extends StatefulWidget {
  final Text text;
  final RenderController controller;

  const SeoRenderer({Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  _SeoRendererState createState() => _SeoRendererState();
}

class _SeoRendererState extends State<SeoRenderer> {
  DivElement div = new DivElement();
  final key = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => addDivElement(context));
    widget.controller.refresh = refresh;
  }

  void refresh() {
    div.style.top = '${key.globalPaintBounds?.top ?? 0}px';
    div.style.left = '${key.globalPaintBounds?.left ?? 0}px';
    div.text = widget.text.data.toString();
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
    if (!_regExp.hasMatch(window.navigator.userAgent.toString())) {
      return;
    }
    div.style.position = 'absolute';
    div.style.top = '${key.globalPaintBounds?.top ?? 0}px';
    div.style.left = '${key.globalPaintBounds?.left ?? 0}px';
    div.text = widget.text.data.toString();
    div.style.color = '#ff0000';
    document.body?.insertAdjacentElement('afterEnd', div);
  }
}

class RenderController {
  late UI.VoidCallback refresh;
}
