# SEO Renderer

<a href="https://pub.dev/packages/seo_renderer"> <img height="20" alt="Pub" src="https://img.shields.io/pub/v/seo_renderer.svg?style=for-the-badge">
</a>

A flutter plugin (_under development_) to render text, link, image widgets as html elements for SEO purpose.

Created specifically for issue <https://github.com/flutter/flutter/issues/46789>
It will automatic detect the crawler using regex and navigator userAgent and add the `HtmlElement` you choose to the DOM.

All PR's are welcome :)

## Getting Started

- Add this to your pubspec.yaml

  ```yaml
  dependencies:
    seo_renderer: ^0.4.0
  ```

- Get the package from Pub:

  ```bash
  flutter packages get
  ```

- Import it in your file

  ```dart
  import 'package:seo_renderer/seo_renderer.dart';
  ```

## Usage

It's required to add a `RobotDetector` to detect if page is visited by a robot and add `seoRouteObserver` to observe when widgets change their visibility. To do this simply wrap `MaterialApp` within `RobotDetector` and add `seoRouteObserver` in navigatorObservers:

```dart
runApp(
  RobotDetector(
    debug: true, // you can set true to enable robot mode
    child: MaterialApp(
      home: MyApp(),
      navigatorObservers: [seoRouteObserver],
    ),
  ),
);
```

### TextRenderer

To render html text element above a child you pass `Text`, `RichText` as the child or simply set the `text`.

```dart
TextRenderer(
  child: Text(
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
)

TextRenderer(
  text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  child: CustomWidget(),
)
```

Optionally you can change the html element between `<h1>` to `<h6>` and `<p>` by setting `style`. Default value is `TextRendererStyle.paragraph`.

```dart
TextRenderer(
  style: TextRendererStyle.paragraph,
  child: Text(
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
)

TextRenderer(
  style: TextRendererStyle.header1,
  child: Text(
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
)
```

### LinkRenderer

To render html link element above a child set `text` and `href`.

```dart
LinkRenderer(
  text: 'Try Flutter',
  href: 'https://www.flutter.dev',
  child: ...,
)
```

### ImageRenderer

To render html image element above a child set `alt` and pass `Image.network(...)`, `Image.asset(...)`, `Image.memory(...)` as the child or simply set the `src`.

```dart
ImageRenderer(
  alt: 'Network Image',
  child: Image.network('https://fakeimg.pl/300x300/?text=Network'),
)

ImageRenderer(
  alt: 'Network Image',
  src: 'https://fakeimg.pl/300x300/?text=Network',
  child: CustomWidget(),
)
```

## ScreenShot & Example

Live example <https://seo-renderer.netlify.app/>

Select GoogleBot [here's how](https://www.howtogeek.com/113439/how-to-change-your-browsers-user-agent-without-installing-any-extensions/) as userAgent in Network Condition and refresh the page to see created Div Elements.

<p align="center">
<img src="https://raw.githubusercontent.com/iamSahdeep/seo_renderer/master/assets/1.png" width="410" height="440">
</p>

## License

```text
MIT License

Copyright (c) 2021 Sahdeep Singh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Author & support

This project is created by [Sahdeep Singh](https://github.com/iamSahdeep)

> If you appreciate my work you can connect and endorse me on [LinkedIn](https://www.linkedin.com/in/iamsahdeep/) to keep me motivated :)

<img src="https://cdn-images-1.medium.com/max/1200/1*2yFbiGdcACiuLGo4dMKmJw.jpeg" width="90" height="35">
