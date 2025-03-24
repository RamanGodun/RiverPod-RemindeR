import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_on_gen_notifier_provider_gen.g.dart';

@Riverpod(keepAlive: true)
class GenCounterOnNotifier extends _$GenCounterOnNotifier {
  @override
  int build(int initialValue) {
    ref.onDispose(() {
      debugPrint('[counterProviderOnNotifier] was disposed');
    });
    return initialValue;
  }

  void increment() {
    state++;
  }
}
