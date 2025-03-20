import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeCounterProvider =
    AutoDisposeNotifierProvider<CounterNotifier, int>(CounterNotifier.new);

class CounterNotifier extends AutoDisposeNotifier<int> {
  @override
  int build() {
    ref.onDispose(() => debugPrint('[CounterNotifier] disposed'));
    return 0;
  }

  void increment() => state++;
}
