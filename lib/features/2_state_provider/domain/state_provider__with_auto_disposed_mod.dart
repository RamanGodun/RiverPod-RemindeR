import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_provider__with_auto_disposed_mod.g.dart';

@Riverpod(keepAlive: false)
class WithAutoDisposedModCounter extends _$WithAutoDisposedModCounter {
  @override
  int build() {
    ref.onDispose(() {
      debugPrint('🛑 [WithAutoDisposedModCounter] was disposed');
    });
    return 0;
  }

  void increment() => state++;
  void reset() => state = 0;
}

@Riverpod(keepAlive: false)
int clickedTimeWithAutoDisposedModeSimple(Ref ref) {
  final clickingCount = ref.watch(withAutoDisposedModCounterProvider);
  ref.onDispose(() {
    debugPrint('🛑 [clickedTimeWithAutoDisposedModeSimple] was disposed');
  });
  return clickingCount;
}
