import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'for_errors_simulation_counter_provider.g.dart';

/// A shared counter provider used to help to simulate errors in multiple providers.
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
