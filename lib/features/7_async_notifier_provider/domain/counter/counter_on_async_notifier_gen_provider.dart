import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_on_async_notifier_gen_provider.g.dart';

// Counter class using Riverpod's code generation for state management.
@riverpod
class Counter extends _$Counter {
  @override
  // The `build` method initializes the state with the provided `arg` value.
  // This method is automatically called when the provider is first created.
  Future<int> build(int arg) async {
    ref.onDispose(() {
      print('[counterProvider] disposed');
    });
    await _waitASec(); // Simulate an initial delay.
    return arg; // Return the initial counter value.
  }

  // Utility method to simulate a delay for async operations.
  Future<void> _waitASec() => Future.delayed(const Duration(milliseconds: 150));

  // Increment the counter value with a simulated async delay.
  Future<void> increment() async {
    state = const AsyncLoading();
    // Use `AsyncValue.guard` to handle potential errors during the state update.
    state = await AsyncValue.guard(() async {
      await _waitASec();
      return state.value! + 1;
    });
  }

  // Decrement the counter value with a simulated async delay.
  Future<void> decrement() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _waitASec();
      return state.value! - 1;
    });
  }
}
