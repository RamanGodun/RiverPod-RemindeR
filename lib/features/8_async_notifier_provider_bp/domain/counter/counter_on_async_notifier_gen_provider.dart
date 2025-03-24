import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_on_async_notifier_gen_provider.g.dart';

@riverpod
class GenCounterOnAsyncNotifier extends _$GenCounterOnAsyncNotifier {
  @override
  // The `build` method initializes the state with the provided `arg` value.
  Future<int> build(int arg) async {
    ref.onDispose(() {
      debugPrint('[counterProvider] disposed');
    });
    await _waitASec(); // Simulate an initial delay.
    return arg; // the initial counter value.
  }

  /// Utility method to simulate a delay for async operations.
  Future<void> _waitASec() => Future.delayed(const Duration(milliseconds: 75));

  Future<void> increment() async {
    state = const AsyncLoading();
    // Use `AsyncValue.guard` to handle potential errors during the state update.
    state = await AsyncValue.guard(() async {
      await _waitASec();
      return state.value! + 1;
    });
  }

  ///
  Future<void> decrement() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _waitASec();
      return state.value! - 1;
    });
  }
}
