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
            style: TextRendererStyle.header1,
            child: Text('Heading element <H1>'),
          ),
          TextRenderer(
            style: TextRendererStyle.header2,
            child: Text('Heading element <H2> and etc to h6'),
          ),
          TextRenderer(
            style: TextRendererStyle.paragraph,
            child: Text(
              'Paragraph <p>: Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            ),
          ),
        ],
      )),
    );
  }
}
