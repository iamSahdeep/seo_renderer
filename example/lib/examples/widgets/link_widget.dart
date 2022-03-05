import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkWidget extends StatelessWidget {
  const LinkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinkRenderer(
      text: 'Try Flutter',
      href: 'https://www.flutter.dev',
      child: OutlinedButton(
        onPressed: () => launch('https://www.flutter.dev'),
        child: Text('Flutter.dev'),
      ),
    );
  }
}
