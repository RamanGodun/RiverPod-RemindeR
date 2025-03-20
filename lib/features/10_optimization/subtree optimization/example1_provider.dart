import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example1_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
class CounterForExample1Page extends _$CounterForExample1Page {
  @override
  int build() {
    return 0;
  }

  void increment(int incrementSize) => state += incrementSize;
}

class Counter100ForExample1Page extends CounterForExample1Page {
  @override
  int build() {
    return 100;
  }
}
