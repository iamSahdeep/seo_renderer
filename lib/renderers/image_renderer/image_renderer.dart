/// Conditional imports based on if 'dart.io' is supported.
///
/// We export lib 'image_renderer_web.dart', but if dart.io is supported
/// then we export 'image_renderer_vm.dart' instead.
export 'image_renderer_web.dart' if (dart.library.io) 'image_renderer_vm.dart';
