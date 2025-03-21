import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterOnAsyncNotifierManualProvider = AsyncNotifierProvider.family
    .autoDispose<Counter, int, int>(Counter.new);

class Counter extends AutoDisposeFamilyAsyncNotifier<int, int> {
  @override
  FutureOr<int> build(int arg) async {
    ref.onDispose(() => print('[counterProvider] was disposed'));
    await _waitASec(); // Simulate a delay.
    return arg;
  }

  /*
* Utility method to simulate a delay, often used for testing async flows.*/
  Future<void> _waitASec() => Future.delayed(const Duration(milliseconds: 250));

  /*
   * Simulates an async increment operation with a delay before incrementing the counter.
   * Uses `AsyncValue.guard` to handle errors safely during state updates.
   */
  Future<void> increment() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _waitASec();
      errorImitation(); // Uncomment this line to simulate an error during increment.
      return state.value! + 1;
    });
  }

  ///
  Future<void> decrement() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _waitASec();
      // errorImitation2(); // Uncomment this line to simulate an error during decrement.
      return state.value! - 1;
    });
  }

  /*
   * Simulates an error when the counter reaches a value of 2.
   */
  void errorImitation() {
    if (state.value == 2) {
      throw 'Simulation of increment failure';
    }
  }

  /*
   * Simulates a decrement error with a `Never` type, which indicates this function never returns */
  Never errorImitation2() => throw 'Fail to decrement';
  //
}
