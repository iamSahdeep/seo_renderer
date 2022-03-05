import 'package:flutter/material.dart';

final seoRouteObserver = RouteObserver<ModalRoute<void>>();

abstract class RendererState<T extends StatefulWidget> extends State<T>
    implements RouteAware {
  Size? size;
  var visible = true;

  void onSize(Size newSize) {
    if (size == newSize) return;

    if (newSize.isEmpty) {
      size = null;
    } else {
      size = newSize;
    }

    if (!mounted) return;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route == null) {
      setState(() => visible = true);
      return;
    }

    seoRouteObserver.subscribe(this, route);
  }

  @override
  void didPop() {
    // do nothing as the route will be disposed
  }

  @override
  void didPopNext() {
    setState(() => visible = true);
  }

  @override
  void didPush() {
    setState(() => visible = true);
  }

  @override
  void didPushNext() {
    setState(() => visible = false);
  }

  @override
  void dispose() {
    seoRouteObserver.unsubscribe(this);
    super.dispose();
  }
}
