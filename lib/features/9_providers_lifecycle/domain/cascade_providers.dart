import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cascade_providers.g.dart';

/*
 ! ⚠️ Changing the provider types (e.g., adding AutoDispose, or switching between NotifierProvider, StateProvider, Provider)
   can lead to unexpected behavior in cascade providers.
 
 ? Try experimenting with different provider types and observe the behavior 😉
 
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
    print('[cascadeCounterProvider] initialized');
    ref.onDispose(() {
      print('[cascadeCounterProvider] disposed');
    });
    ref.onCancel(() {
      print('[cascadeCounterProvider] cancelled');
    });
    ref.onResume(() {
      print('[cascadeCounterProvider] resumed');
    });
    ref.onAddListener(() {
      print('[cascadeCounterProvider] listener added');
    });
    ref.onRemoveListener(() {
      print('[cascadeCounterProvider] listener removed');
    });

    return 0;
  }

  void increment() => state++;
}

@riverpod
String age(Ref ref) {
  print('[ageProvider] initialized');
  ref.onDispose(() {
    print('[ageProvider] disposed');
  });
  ref.onCancel(() {
    print('[ageProvider] cancelled');
  });
  ref.onResume(() {
    print('[ageProvider] resumed');
  });
  ref.onAddListener(() {
    print('[ageProvider] listener added');
  });
  ref.onRemoveListener(() {
    print('[ageProvider] listener removed');
  });

  final age = ref.watch(cascadeCounterProvider);

  return 'I am $age years old';
}
