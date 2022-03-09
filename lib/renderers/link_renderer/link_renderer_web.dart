// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/renderer_state.dart';
import 'package:seo_renderer/helpers/robot_detector_web.dart';
import 'package:seo_renderer/helpers/size_widget.dart';

/// A Widget to create the HTML Tags but with Link (href) from any [Widget].
class LinkRenderer extends StatefulWidget {
  /// Default [LinkRenderer] const constructor.
  const LinkRenderer({
    Key? key,
    required this.child,
    required this.text,
    required this.href,
  }) : super(key: key);

  ///Any Widget with link in it
  final Widget child;

  ///Anchor Text just like html, will work like a replacement to provided [child] with [href] to it.
  final String text;

  ///link to put in href
  final String href;

  @override
  _LinkRendererState createState() => _LinkRendererState();
}

class _LinkRendererState extends RendererState<LinkRenderer> {
  @override
  Widget build(BuildContext context) {
    if (!RobotDetector.detected(context)) {
      return widget.child;
    }

    final viewType = 'html-link-${widget.href}';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (_) => AnchorElement(href: widget.href)
        ..text = widget.text
        ..style.fontSize = '14px'
        ..style.color = '#ff0000'
        ..style.margin = '0px'
        ..style.padding = '0px'
        ..style.width = '${size?.width ?? 0}px'
        ..style.height = '${size?.height ?? 0}px',
    );

    return SizedBox.fromSize(
      size: size,
      child: Stack(
        children: [
          SizeWidget(
            onSize: onSize,
            child: widget.child,
          ),
          if (size != null && visible)
            IgnorePointer(
              child: HtmlElementView(viewType: viewType),
            ),
        ],
      ),
    );
  }
}
