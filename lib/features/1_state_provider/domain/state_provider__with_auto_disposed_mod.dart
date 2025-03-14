import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_provider__with_auto_disposed_mod.g.dart';

final counterProviderWithAutoDisposedMod = StateProvider.autoDispose<int>((
  ref,
) {
  ref.onDispose(
    () => debugPrint('🛑 [counterProviderWithAutoDisposedMod] was disposed'),
  );
  return 0;
});

@Riverpod(keepAlive: false)
int clickedTimeWithAutoDisposedModeSimple(Ref ref) {
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final clickingCount = ref.watch(counterProviderWithAutoDisposedMod);
  ref.onDispose(() {
    debugPrint('🛑 [clickedTimeWithAutoDisposedModeSimple] was disposed');
  });
  return clickingCount;
}
