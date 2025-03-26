import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_on_keep_alive_10_sec_provider.g.dart';

@riverpod
class CounterOnKeepAlive10Sec extends _$CounterOnKeepAlive10Sec {
  @override
  int build() {
    // next allows to cache data for some time (for example for 10 sec)
    final keepAliveLink = ref.keepAlive();
    Timer? timer;

    debugPrint('[counterOnKeepAlive10SecProvider] initialized');

    ref
      ..onDispose(() {
        debugPrint('[syncKeepAliveCounterProvider] disposed, timer cancelled');
        // canceling timer so it's reset next time
        timer?.cancel();
      })
      ..onCancel(() {
        debugPrint('[syncKeepAliveCounterProvider] cancelled, timer started');
        timer = Timer(const Duration(seconds: 10), () {
          keepAliveLink.close();
        });
      })
      ..onResume(() {
        debugPrint('[syncKeepAliveCounterProvider] resumed, timer cancelled');
        // canceling timer to avoid executing keepAliveLink.close()
        timer?.cancel();
      })
      ..onAddListener(() {
        debugPrint('[syncKeepAliveCounterProvider] listener added');
      })
      ..onRemoveListener(() {
        debugPrint('[syncKeepAliveCounterProvider] listener removed');
      });

    return 0;
  }

  void increment() => state++;
}
