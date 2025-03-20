import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counters_provider_for_scoping_and_overlay.g.dart';

@riverpod
class ForOptimizationPageCounter extends _$ForOptimizationPageCounter {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;
}
