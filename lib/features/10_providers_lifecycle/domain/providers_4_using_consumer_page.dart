import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_4_using_consumer_page.g.dart';

/// 🧮 Counter with autoDispose lifecycle hooks
@riverpod
class OneCounter extends _$OneCounter {
  @override
  int build() {
    debugPrint('[OneCounter] initialized');

    ref
      ..onDispose(() => debugPrint('[OneCounter] disposed'))
      ..onCancel(() => debugPrint('[OneCounter] cancelled'))
      ..onResume(() => debugPrint('[OneCounter] resumed'))
      ..onAddListener(() => debugPrint('[OneCounter] listener added'))
      ..onRemoveListener(() => debugPrint('[OneCounter] listener removed'));

    return 0;
  }

  void increment() => state++;
}

/// 🔟 Counter with base value and lifecycle logging
@riverpod
class AnotherCounter extends _$AnotherCounter {
  @override
  int build() {
    debugPrint('[AnotherCounter] initialized');

    ref
      ..onDispose(() => debugPrint('[AnotherCounter] disposed'))
      ..onCancel(() => debugPrint('[AnotherCounter] cancelled'))
      ..onResume(() => debugPrint('[AnotherCounter] resumed'))
      ..onAddListener(() => debugPrint('[AnotherCounter] listener added'))
      ..onRemoveListener(() => debugPrint('[AnotherCounter] listener removed'));

    return 10;
  }

  void increment() => state += 10;
}
