import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_on_keep_alive_10_sec_provider.g.dart';

@riverpod
class CounterOnKeepAlive10Sec extends _$CounterOnKeepAlive10Sec {
  @override
  int build() {
    // next allows to cash data for some time (for example for 10 sec)
    final keepAliveLink = ref.keepAlive();
    Timer? timer;

    debugPrint('[counterOnKeepAlive10SecProvider] initialized');
    ref.onDispose(() {
      debugPrint('[syncKeepAliveCounterProvider] disposed, timer cancelled');
      // canceling of timer for it will be available next time
      timer?.cancel();
    });
    ref.onCancel(() {
      debugPrint('[syncKeepAliveCounterProvider] cancelled, timer started');
      timer = Timer(const Duration(seconds: 10), () {
        keepAliveLink.close();
      });
    });
    ref.onResume(() {
      debugPrint('[syncKeepAliveCounterProvider] resumed, timer cancelled');
      // canceling of timer to avoid executing of "keepAliveLink.close()"
      timer?.cancel();
    });
    ref.onAddListener(() {
      debugPrint('[syncKeepAliveCounterProvider] listener added');
    });
    ref.onRemoveListener(() {
      debugPrint('[syncKeepAliveCounterProvider] listener removed');
    });

    return 0;
  }

  void increment() => state++;
}
