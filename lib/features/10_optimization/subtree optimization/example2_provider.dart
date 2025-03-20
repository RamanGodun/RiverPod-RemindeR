import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example2_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
class Ex2Counter extends _$Ex2Counter {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;
}

class Ex2Counter10 extends Ex2Counter {
  @override
  int build() {
    return 10;
  }
}

class Ex2Counter100 extends Ex2Counter {
  @override
  int build() {
    return 100;
  }
}

@Riverpod(dependencies: [Ex2Counter])
int ex2AdjustedCounter(Ref ref) {
  return ref.watch(ex2CounterProvider) * 2;
}
