import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_4_using_consumer_page.g.dart';

@riverpod
class OneCounter extends _$OneCounter {
  @override
  int build() {
    print('[autoDisposeCounterProvider] initialized');
    ref.onDispose(() {
      print('[autoDisposeCounterProvider] disposed');
    });
    ref.onCancel(() {
      print('[autoDisposeCounterProvider] cancelled');
    });
    ref.onResume(() {
      print('[autoDisposeCounterProvider] resumed');
    });
    ref.onAddListener(() {
      print('[autoDisposeCounterProvider] listener added');
    });
    ref.onRemoveListener(() {
      print('[autoDisposeCounterProvider] listener removed');
    });
    return 0;
  }

  void increment() => state++;
}

@riverpod
class AnotherCounter extends _$AnotherCounter {
  @override
  int build() {
    print('[anotherCounterProvider] initialized');
    ref.onDispose(() {
      print('[anotherCounterProvider] disposed');
    });
    ref.onCancel(() {
      print('[anotherCounterProvider] cancelled');
    });
    ref.onResume(() {
      print('[anotherCounterProvider] resumed');
    });
    ref.onAddListener(() {
      print('[anotherCounterProvider] listener added');
    });
    ref.onRemoveListener(() {
      print('[anotherCounterProvider] listener removed');
    });

    return 10;
  }

  void increment() => state += 10;
}
