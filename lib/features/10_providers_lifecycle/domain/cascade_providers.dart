import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cascade_providers.g.dart';

/*
 ! ⚠️ Changing the provider types (e.g., adding AutoDispose, or switching between NotifierProvider, StateProvider, Provider)
   can lead to unexpected behavior in cascade providers.

 * This happens because the dependent provider (ageProvider) rebuilds when cascadeCounterProvider changes.
 * Modifying the base provider's type can affect:
    - Its lifecycle hooks (onDispose/onCancel/onResume)
    - When and how listeners are triggered
    - Whether dependent providers are disposed/rebuilt

 !!! Always check dependency chains when modifying provider types!
*/

@riverpod
class CascadeCounter extends _$CascadeCounter {
  @override
  int build() {
    debugPrint('[cascadeCounterProvider] initialized');

    ref
      ..onDispose(() => debugPrint('[cascadeCounterProvider] disposed'))
      ..onCancel(() => debugPrint('[cascadeCounterProvider] cancelled'))
      ..onResume(() => debugPrint('[cascadeCounterProvider] resumed'))
      ..onAddListener(
        () => debugPrint('[cascadeCounterProvider] listener added'),
      )
      ..onRemoveListener(
        () => debugPrint('[cascadeCounterProvider] listener removed'),
      );

    return 0;
  }

  void increment() => state++;
}

@riverpod
String age(Ref ref) {
  debugPrint('[ageProvider] initialized');

  ref
    ..onDispose(() => debugPrint('[ageProvider] disposed'))
    ..onCancel(() => debugPrint('[ageProvider] cancelled'))
    ..onResume(() => debugPrint('[ageProvider] resumed'))
    ..onAddListener(() => debugPrint('[ageProvider] listener added'))
    ..onRemoveListener(() => debugPrint('[ageProvider] listener removed'));

  final age = ref.watch(cascadeCounterProvider);
  return 'I\'ve already clicked $age time${age == 1 ? '' : 's'}';
}
