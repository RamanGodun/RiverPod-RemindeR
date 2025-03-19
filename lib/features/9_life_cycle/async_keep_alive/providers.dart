import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class SyncKeepAliveCounter extends _$SyncKeepAliveCounter {
  @override
  int build() {
    // next allows to cash data for some time (for example for 10 sec)
    final keepAliveLink = ref.keepAlive();
    Timer? timer;

    print('[syncKeepAliveCounterProvider] initialized');
    ref.onDispose(() {
      print('[syncKeepAliveCounterProvider] disposed, timer cancelled');
      // canceling of timer for it will be available next time
      timer?.cancel();
    });
    ref.onCancel(() {
      print('[syncKeepAliveCounterProvider] cancelled, timer started');
      timer = Timer(const Duration(seconds: 10), () {
        keepAliveLink.close();
      });
    });
    ref.onResume(() {
      print('[syncKeepAliveCounterProvider] resumed, timer cancelled');
      // canceling of timer to avoid executing of "keepAliveLink.close()"
      timer?.cancel();
    });
    ref.onAddListener(() {
      print('[syncKeepAliveCounterProvider] listener added');
    });
    ref.onRemoveListener(() {
      print('[syncKeepAliveCounterProvider] listener removed');
    });

    return 0;
  }

  void increment() => state++;
}
