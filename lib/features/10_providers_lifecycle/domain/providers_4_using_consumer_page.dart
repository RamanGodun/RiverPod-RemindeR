import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_4_using_consumer_page.g.dart';

@riverpod
class OneCounter extends _$OneCounter {
  @override
  int build() {
    debugPrint('[autoDisposeCounterProvider] initialized');
    ref.onDispose(() {
      debugPrint('[autoDisposeCounterProvider] disposed');
    });
    ref.onCancel(() {
      debugPrint('[autoDisposeCounterProvider] cancelled');
    });
    ref.onResume(() {
      debugPrint('[autoDisposeCounterProvider] resumed');
    });
    ref.onAddListener(() {
      debugPrint('[autoDisposeCounterProvider] listener added');
    });
    ref.onRemoveListener(() {
      debugPrint('[autoDisposeCounterProvider] listener removed');
    });
    return 0;
  }

  void increment() => state++;
}

@riverpod
class AnotherCounter extends _$AnotherCounter {
  @override
  int build() {
    debugPrint('[anotherCounterProvider] initialized');
    ref.onDispose(() {
      debugPrint('[anotherCounterProvider] disposed');
    });
    ref.onCancel(() {
      debugPrint('[anotherCounterProvider] cancelled');
    });
    ref.onResume(() {
      debugPrint('[anotherCounterProvider] resumed');
    });
    ref.onAddListener(() {
      debugPrint('[anotherCounterProvider] listener added');
    });
    ref.onRemoveListener(() {
      debugPrint('[anotherCounterProvider] listener removed');
    });

    return 10;
  }

  void increment() => state += 10;
}
