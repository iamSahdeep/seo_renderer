import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/scroll_listener/renderer_scroll_listener.dart';

abstract class ScrollAware {
  Listenable? _listenable;

  void subscribe(BuildContext context) {
    unsubscribe();
    _listenable = RendererScrollListener.of(context);
    _listenable?.addListener(didScroll);
  }

  void unsubscribe() {
    _listenable?.removeListener(didScroll);
  }

  void didScroll();
}
