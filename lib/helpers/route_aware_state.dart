import 'package:flutter/material.dart';

final seoRouteObserver = RouteObserver<ModalRoute<void>>();

abstract class RouteAwareState<T extends StatefulWidget> extends State<T>
    implements RouteAware {
  var visible = true;

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
