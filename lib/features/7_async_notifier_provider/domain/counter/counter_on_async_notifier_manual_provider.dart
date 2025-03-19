import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// AsyncNotifierProvider with family and autoDispose modifiers to manage state for a counter.
final counterProvider =
    AsyncNotifierProvider.family.autoDispose<Counter, int, int>(Counter.new);

// The Counter class manages the state of an integer value using Riverpod's AsyncNotifier.
// It includes functionality for incrementing, decrementing, and simulating errors.

// ! The class name must correspond to the type of modifier used:
//  When using AsyncNotifierProvider.autoDispose, the class should extend "AutoDisposeAsyncNotifier<int>"
//  AsyncNotifierProvider =>  AsyncNotifier<int>
//  AsyncNotifierProvider.family.autoDispose =>  AutoDisposeFamilyAsyncNotifier<int, int>

class Counter extends AutoDisposeFamilyAsyncNotifier<int, int> {
  @override
  // The `build` method initializes the state with the provided argument.
  // In this case, `arg` is used to avoid confusion with other potential reserved keywords.
  FutureOr<int> build(int arg) async {
    ref.onDispose(() => print('[counterProvider] was disposed'));
    await _waitASec(); // Simulate a delay.
    return arg; // Set the initial state to the provided argument.
  }

/*
* Utility method to simulate a delay, often used for testing async flows.
*/
  Future<void> _waitASec() => Future.delayed(const Duration(milliseconds: 250));

/*
* Increment method that triggers state change.
* Simulates an async operation with a delay before incrementing the counter.
* Uses `AsyncValue.guard` to handle errors safely during state updates.
*/
  Future<void> increment() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _waitASec();
      // errorImitation(); // Uncomment this line to simulate an error during increment.
      return state.value! + 1;
    });
  }

/*
* Decrement method that triggers state change.
* Similar to `increment`, but decreases the counter instead.
* Handles errors safely using `AsyncValue.guard`.
*/
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
      throw 'Fail to increment'; // Simulate a failure during increment.
    }
  }

/*
* Simulates a decrement error with a `Never` type, which indicates this function never returns.
*/
  Never errorImitation2() => throw 'Fail to decrement';

  //
}
