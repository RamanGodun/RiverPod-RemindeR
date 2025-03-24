import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
The state of AutoDisposeFamilyNotifier have to be initialized SYNCHRONOUSLY
(if it's initialized ASYNCHRONOUSLY -- then use ASYNC NOTIFIER)
 */

// the name of extended class must correspond to mods
// NotifierProvider.autoDispose.family =>  AutoDisposeFamilyNotifier<int, int>
class ManualCounterOnNotifier extends AutoDisposeFamilyNotifier<int, int> {
  @override
  int build(int arg) {
    ref.onDispose(() {
      debugPrint('[counterProviderOnNotifier] was disposed');
    });
    return arg;
  }

  void increment() {
    state++;
  }
}

final counterOnManualNotifierProvider = NotifierProvider.autoDispose
    .family<ManualCounterOnNotifier, int, int>(ManualCounterOnNotifier.new);
