import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example1_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
class Ex1Counter extends _$Ex1Counter {
  @override
  int build() {
    return 0;
  }

  void increment(int incrementSize) => state += incrementSize;
}

class Ex1Counter100 extends Ex1Counter {
  @override
  int build() {
    return 100;
  }
}
