import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_4_provider_scope_overrides_example.g.dart';

/// A simple integer counter with customizable initial value.
@Riverpod(keepAlive: true, dependencies: [])
class BaseCounter extends _$BaseCounter {
  @override
  int build() => 0;

  /// Increment the current state by [value].
  void increment(int value) => state += value;
}

/// A specialized version of [ExampleCounter] with an initial value of 100.
class BaseCounterStartingAt100 extends BaseCounter {
  @override
  int build() => 100;
}
