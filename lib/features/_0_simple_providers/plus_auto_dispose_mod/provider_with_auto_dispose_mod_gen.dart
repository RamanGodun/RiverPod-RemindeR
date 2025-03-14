import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart'; // Для debugPrint

part 'provider_with_auto_dispose_mod_gen.g.dart';

@riverpod
String autoDisposedModeWithSimpleGen(Ref ref) {
  debugPrint('✅ [autoDisposedModeWithSimpleGen] was created');

  ref.onDispose(() {
    debugPrint('🛑 [autoDisposedModeWithSimpleGen] was disposed');
  });

  return 'Text from Provider with autodisposed modification and with code generation';
}
