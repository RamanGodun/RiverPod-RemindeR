import 'package:flutter_riverpod/flutter_riverpod.dart';
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

/// Specialized version of [BaseCounter] with an initial value of 100.
class BaseCounterStartingAt100 extends BaseCounter {
  @override
  int build() => 100;
}

/// Another basic counter provider with a default initial state of 0.
@Riverpod(keepAlive: true, dependencies: [])
class SecondBaseCounter extends _$SecondBaseCounter {
  @override
  int build() => 0;

  /// Increment the counter by 1.
  void increment() => state++;
}

/// Specialized version of [SecondBaseCounter] with initial state of 10.
class SecondBaseCounterStartingAt10 extends SecondBaseCounter {
  @override
  int build() => 10;
}

/// Specialized version of [SecondBaseCounter] with initial state of 100.
class SecondBaseCounterStartingAt100 extends SecondBaseCounter {
  @override
  int build() => 100;
}

/// Derived provider calculating double the state of [SecondBaseCounter].
@Riverpod(dependencies: [SecondBaseCounter])
int doubledSecondBaseCounter(Ref ref) {
  return ref.watch(secondBaseCounterProvider) * 2;
}
