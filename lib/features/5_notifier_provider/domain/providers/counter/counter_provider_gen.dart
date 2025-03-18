import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider_gen.g.dart';

@riverpod
class CounterOnNotifier extends _$CounterOnNotifier {
  @override
  int build(int initialValue) {
    ref.onDispose(() {
      print('[counterProviderOnNotifier] was disposed');
    });
    return initialValue;
  }

  void increment() {
    state++;
  }
}
