import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
The state of AutoDisposeFamilyNotifier have to be initialized SYNCHRONOUSLY
(if it's initialized ASYNCHRONOUSLY -- then use ASYNC NOTIFIER)
 */

// the name of extended class must correspond to mods
// NotifierProvider.autoDispose.family =>  AutoDisposeFamilyNotifier<int, int>
class CounterOnNotifier extends AutoDisposeFamilyNotifier<int, int> {
  @override
  int build(int arg) {
    ref.onDispose(() {
      print('[counterProviderOnNotifier] was disposed');
    });
    return arg;
  }

  void increment() {
    state++;
  }
}

final counterOnNotifierProvider = NotifierProvider.autoDispose
    .family<CounterOnNotifier, int, int>(CounterOnNotifier.new);
