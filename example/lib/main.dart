import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:seo_renderer_example/examples/image_renderer_example.dart';
import 'package:seo_renderer_example/examples/link_singletext_example.dart';
import 'package:seo_renderer_example/examples/scrollable_content.dart';
import 'package:seo_renderer_example/examples/single_text_item.dart';

void main() {
  runApp(
    RobotDetector(
      child: MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SingleTextItem()));
              },
              child: TextRenderer(
                text: 'Single Text Item',
                child: Text('Single Text Item'),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ScrollableContent()));
              },
              child: TextRenderer(
                text: 'Scrollable Text Content',
                child: Text('Scrollable Text Content'),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SingleTextLinkExample()));
              },
              child: TextRenderer(
                text: 'Single Link Text Item',
                child: Text('Single Link Text Item'),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ImageRendererExample()));
              },
              child: TextRenderer(
                text: 'Image renderer',
                child: Text('Image renderer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
