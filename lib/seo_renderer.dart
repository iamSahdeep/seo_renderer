import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as UI;

///Regex to detect Crawler for Search Engines
RegExp _regExp = RegExp(r'/bot|google|baidu|bing|msn|teoma|slurp|yandex/i');

/// A GlobalKey Extension to get Rect from the RenderObject from a GlobalKey
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

/// A Widget to create the HTML Tags from the TEXT widget.
class TextRenderer extends StatefulWidget {
  final Text text;
  final RenderController? controller;

  const TextRenderer({Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  _TextRendererState createState() => _TextRendererState();
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
    if (!_regExp.hasMatch(window.navigator.userAgent.toString())) {
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
