import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleTextLinkExample extends StatelessWidget {
  const SingleTextLinkExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinkRenderer(
          anchorText: 'Some other Anchor Text',
          link: 'https://www.flutter.dev',
          child: OutlinedButton(
            onPressed: () {
              launch('https://www.flutter.dev');
            },
            child: Text('Flutter.dev'),
          ),
        ),
      ),
    );
  }
}
