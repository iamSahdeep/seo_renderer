# SEO Renderer

A flutter plugin to render text widgets as html for SEO purpose.

Created for issue https://github.com/flutter/flutter/issues/46789 and we can maintain it till Flutter creates something concrete for us :)

It will automatic detect the crawler using regex and navigator userAgent and add the `DivElement`(only) to DOM.

All PR's are welcome :) 

# Getting Started

* Add this to your pubspec.yaml
  ```
  dependencies:
    seo_renderer: ^0.0.1
  
  ```
* Get the package from Pub:

  ```
  flutter packages get
  ```
* Import it in your file

  ```
  import 'package:seo_renderer/seo_renderer.dart';
  ```
  
# Usage
Just pass the your `Text` Widget and a `RenderController()` which can be used to refresh in case of Scrollable Content.

```
SeoRenderer(
  controller: RenderController(),
  text: Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the     1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap       into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,   and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'''),
),
```
# ScreenShot

<p align="center">
<img src="https://raw.githubusercontent.com/iamSahdeep/seo_renderer/master/assets/1.png" width="410" height="440">
</p>

# License
```
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
