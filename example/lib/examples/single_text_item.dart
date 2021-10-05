import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

class SingleTextItem extends StatelessWidget {
  const SingleTextItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextRenderer(
            element: new HeadingElement.h1(),
            text: Text('''Heading element <H1>
                  '''),
          ),
          TextRenderer(
            element: new HeadingElement.h2(),
            text: Text('''Heading element <H2> and etc to h6
                  '''),
          ),
          TextRenderer(
            element: new ParagraphElement(),
            text: Text(
              '''Paragraph <p>: Lorem Ipsum is simply dummy text of the printing and typesetting industry.''',
            ),
          ),
        ],
      )),
    );
  }
}
