import 'package:flutter/material.dart';

class RendererScrollListener extends StatefulWidget {
  final Widget child;

  const RendererScrollListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _RendererScrollListenerState createState() => _RendererScrollListenerState();

  static Listenable? of(BuildContext context) {
    return context
        .findAncestorStateOfType<_RendererScrollListenerState>()
        ?._notifier;
  }
}

class _RendererScrollListenerState extends State<RendererScrollListener> {
  final _notifier = _ScrollNotifier();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      child: widget.child,
      onNotification: (_) {
        _notifier.didScroll();
        return false;
      },
    );
  }
}

class _ScrollNotifier extends ChangeNotifier {
  void didScroll() => notifyListeners();
}
