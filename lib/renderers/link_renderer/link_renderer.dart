/// Conditional imports based on if 'dart.io' is supported.
///
/// We export lib 'link_renderer_web.dart', but if dart.io is supported
/// then we export 'link_renderer_vm.dart' instead.
export 'link_renderer_web.dart' if (dart.library.io) 'link_renderer_vm.dart';
