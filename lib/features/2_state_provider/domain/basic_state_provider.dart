import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_state_provider.g.dart';

/// 🏗 **StateProvider for managing an integer state of counter**.
/// ? 📀 **CD-RW analogy**: This provider acts like a **rewritable CD-RW**, meaning its value can be changed dynamically using: ref.read(counterProvider.notifier).state++;
@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increment() => state++;
  void reset() => state = 0;
}

/*
? in case without using code generation
/// 🏗 **StateProvider for managing an integer counter (without codegen)**
final counterProvider = StateProvider<int>((ref) => 0); 
 */

@Riverpod(keepAlive: true)
int clickedTimes(Ref ref) {
  /// 🔄 **Every time `counterProvider` changes, `clickedTimesProvider` is disposed and recreated**.
  ///  This ensures that `clickedTimesProvider` **always holds the latest value** from `counterProvider`. This also means it will trigger a rebuild on every change.
  final clickingCount = ref.watch(counterProvider);

  /// 🛑 **Logs when `clickedTimesProvider` is disposed**.
  ref.onDispose(() => debugPrint('🛑 [clickedTimes] was disposed'));

  /// ? 📀 **CD-R analogy**: `clickingCount` takes a snapshot (copy) of `counterProvider`'s current value.
  return clickingCount; // ! When `counterProvider` changes, a new "CD-R" is created with the updated value.
}
