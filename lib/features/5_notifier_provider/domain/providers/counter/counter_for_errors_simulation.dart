import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_for_errors_simulation.g.dart';

// A shared counter provider used to simulate errors in multiple providers.
@Riverpod(keepAlive: true)
class ErrorSimulationCounter extends _$ErrorSimulationCounter {
  @override
  int build() => 0;

  // Method to increment the counter and return the updated value.
  int incrementAndGet() {
    state++;
    return state;
  }
}
