import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:url_launcher/url_launcher.dart';

class ScrollableContent extends StatelessWidget {
  const ScrollableContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SEO HTML Tag Creator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < 10; i++) ...[
                TextWidget(),
                TextWidget(),
                LinkWidget(),
                TextWidget(),
                TextWidget(),
                ImageWidget(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextRenderer(
      style: TextRendererStyle.paragraph,
      child: Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageRenderer(
      alt: 'Fake Image',
      src: 'https://fakeimg.pl/300x300/?text=Image',
      child: Image.network("https://fakeimg.pl/300x300/?text=Image"),
    );
  }
}

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
