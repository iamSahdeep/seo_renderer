import 'package:flutter/material.dart';
import 'package:seo_renderer_example/examples/widgets/image_widget.dart';
import 'package:seo_renderer_example/examples/widgets/link_widget.dart';
import 'package:seo_renderer_example/examples/widgets/text_widget.dart';

class VisibilityExample extends StatelessWidget {
  const VisibilityExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TestVisibilityWidget(
                child: TextWidget(),
              ),
              TestVisibilityWidget(
                child: ImageWidget(),
              ),
              TestVisibilityWidget(
                child: LinkWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestVisibilityWidget extends StatefulWidget {
  final Widget child;

  const TestVisibilityWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<TestVisibilityWidget> createState() => _TestVisibilityWidgetState();
}

class _TestVisibilityWidgetState extends State<TestVisibilityWidget> {
  var _visible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () => setState(() => _visible = !_visible),
            child: Text(_visible ? 'Hide' : 'Show'),
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 150),
            child: SizedBox(
              height: _visible ? null : 0.0,
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
