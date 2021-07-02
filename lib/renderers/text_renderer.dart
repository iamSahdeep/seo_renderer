/// Conditional imports based on if 'dart.io' is supported.
///
/// We export lib 'text_renderer_web.dart', but if dart.io is supported
/// then we export 'text_renderer_vm.dart' instead.
export 'text_renderer_web.dart' if (dart.library.io) 'text_renderer_vm.dart';
