# SEO Renderer

<a href="https://pub.dev/packages/seo_renderer"> <img height="20" alt="Pub" src="https://img.shields.io/pub/v/seo_renderer.svg?style=for-the-badge">
</a>

A flutter plugin (_under development_) to render text widgets as html elements for SEO purpose.

Created specifically for issue <https://github.com/flutter/flutter/issues/46789>
It will automatic detect the crawler using regex and navigator userAgent and add the `DivElement`(only) to DOM.

All PR's are welcome :)

## Getting Started

- Add this to your pubspec.yaml

  ```yaml
  dependencies:
    seo_renderer: ^0.2.0
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

First we need to add a `RouteObserver` to automatically remove Html Elements when popped from the Navigation Stack.
To do this simply add this line in `MaterialApp`

```dart
navigatorObservers: <RouteObserver<ModalRoute<void>>>[ routeObserver ],
```

ps : routeObserver is an object, which can be found in utils.dart file.

There are 3 Widgets, `TextRenderer`, `LinkRenderer` & `ImageRenderer`

- **TextRenderer**
  Just pass your `Text`/`RichText` Widget and an optional `RenderController()` which can be used to refresh the content(position) in case of Scrollable Content/ Changed Position .
  Example :

  ```dart
  TextRenderer(
         text: Text(
             'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
       ),
  ```

- **LinkRenderer**
  Need to pass `child : Widget`, `anchorText : String`, `link : String` & an optional `RenderConroller()`

  Example :

  ```dart
      LinkRenderer(
        anchorText: 'Try Flutter',
        link: 'https://www.flutter.dev',
        child: OutlinedButton(
          onPressed: () {
            launch('https://www.flutter.dev');
          },
          child: Text('Flutter.dev'),
        ),
      ),
  ```

- **ImageRenderer**
  Need to pass `child : Widget`, `link : String`, `alt : String` & an optional `RenderConroller()`

  Example :

  ```dart
      ImageRenderer(
          alt: 'Flutter logo',
          link:
              'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
          child: Image.network(
              "https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png"
          ),
      ),
  ```

  RenderController have 2 methods

- `refresh()` : Useful in case Widget changes position and you want it too.
- `clear()` : Sometimes on Push operation Html Elements can't be removed. Please use this in your Push Operation.

## ScreenShot & Example

Live example <https://seo-renderer.netlify.app/>

Select GoogleBot [here's how](https://www.howtogeek.com/113439/how-to-change-your-browsers-user-agent-without-installing-any-extensions/) as userAgent in Network Condition and refresh the page to see created Div Elements.

<p align="center">
<img src="https://raw.githubusercontent.com/iamSahdeep/seo_renderer/master/assets/1.png" width="410" height="440">
</p>

# License

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
