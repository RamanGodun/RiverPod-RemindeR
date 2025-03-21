import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_state_provider.g.dart';

/// 🏗 **StateProvider for managing an integer state (counter)**.
/// ref.read(counterProvider.notifier).state++;
/// ? 📀 **CD-RW analogy**: This provider acts like a **rewritable CD-RW**, meaning its value can be changed dynamically using:
final counterProvider = StateProvider<int>((ref) => 0);

@Riverpod(keepAlive: true)
int clickedTimes(Ref ref) {
  /// 🔄 **Every time `counterProvider` changes, `clickedTimesProvider` is disposed and recreated**.
  /// 🔥 This ensures that `clickedTimesProvider` **always holds the latest value** from `counterProvider`.
  /// 🚨 However, this also means it will trigger a rebuild on every change.
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final clickingCount = ref.watch(counterProvider);

  /// 🛑 **Logs when `clickedTimesProvider` is disposed**.
  ref.onDispose(() => debugPrint('🛑 [clickedTimes] was disposed'));

  /// ? 📀 **CD-R analogy**: `clickingCount` takes a snapshot (copy) of `counterProvider`'s current value.
  return clickingCount; // When `counterProvider` changes, a new "CD-R" is created with the updated value.
}

/*
📌 **Behavior Explanation:**

? If we use:
@riverpod
int clickedTimes(Ref ref) {
  final clickingCount = ref.watch(counterProvider);
  ref.onDispose(() => print('[clickedTimes] was disposed'));
  return clickingCount;
}

?🔍 **Key Differences & Similarities:**
❌  **Unlike** `@Riverpod(keepAlive: true)`, 
this provider **will be removed from memory when you leave the page** (i.e., no longer kept alive globally).
✔️ **Similar to** `@Riverpod(keepAlive: true)`, 
this provider **rebuilds every time `counterProvider` changes**.

*/
