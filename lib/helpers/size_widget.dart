import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SizeWidget extends SingleChildRenderObjectWidget {
  final Function(Size) onSize;

  const SizeWidget({
    Key? key,
    required this.onSize,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _SizeWidgetRenderObject(onSize);
  }
}

class _SizeWidgetRenderObject extends RenderProxyBox {
  final Function(Size) onSize;
  Size? oldSize;

  _SizeWidgetRenderObject(this.onSize);

  @override
  void performLayout() {
    super.performLayout();

    final newSize = child?.size;
    if (newSize == null || newSize == oldSize) return;

    WidgetsBinding.instance?.addPostFrameCallback((_) => onSize(newSize));
  }
}
