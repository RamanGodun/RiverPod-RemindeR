import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'for_errors_simulation_counter_provider.g.dart';

/// A shared counter provider used to simulate errors in multiple providers.
/// Every time [increment] is called, counter increases by 1.
@Riverpod(keepAlive: true)
class ForErrorsSimulationCounter extends _$ForErrorsSimulationCounter {
  @override
  int build() => 0;

  int increment() {
    state++;
    return state;
  }

  void reset() => state = 0;
}
