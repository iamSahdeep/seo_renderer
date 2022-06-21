import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

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

  _SizeWidgetRenderObject(this.onSize);

  @override
  void performLayout() {
    super.performLayout();

    final size = child?.size;
    if (size == null) return;

    if (SchedulerBinding.instance.schedulerPhase !=
        SchedulerPhase.persistentCallbacks) {
      onSize(size);
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) => onSize(size));
    }
  }
}
