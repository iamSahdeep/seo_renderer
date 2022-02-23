# 0.5.0
* Using Widget `RobotDetector` to detect google bot etc. `debug` option to enable robot mode even if user agent don't have it.
* `routeObserver` name changed to `seoRouteObserver`
* `TextRenderer` now can have `Text` or `RichText` as `child` or simply `text` as String. if both supplied `text` property will be prioritised.
* `style` property now have `TextRendererStyle` which is Enum, defaults to `TextRendererStyle.paragraph`
* `LinkRenderer` have `text` property instead of `anchorText` and `href` instead of `link` to provide Link.
* `ImageRenderer` can have `src` which is String type and child which can be any `ImageProvider`. `src` will have priority in both them.
* `RenderScrollListener` is removed and scrolls will be automatically handled.
* All thanks to @krokyze, see [PR11](https://github.com/iamSahdeep/seo_renderer/pull/11)

# 0.4.0
* New ScrollAware widget to listen and update renderer widgets without RenderController. see PR #9

# 0.3.0
* Added Element type with paragraph as default. see PR #6

# 0.2.0
* Included ImageRenderer

# 0.1.0

* Conditional Import in case of VM
* Support of RichText & Text.rich()
* Added clear() method to Controller

## 0.0.4

* making more route aware

## 0.0.3

* Fix : appending elements to body
* removed flutter_html
* clearing elements in case of push as well


## 0.0.2

* Included LinkRender
* Separated TextRenderer
* Route Observers to remove Element from html


## 0.0.1

* Initial Release
