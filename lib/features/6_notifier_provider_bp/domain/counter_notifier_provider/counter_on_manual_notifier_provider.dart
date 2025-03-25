import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 🏗️ AutoDispose Family Notifier — manages integer counter state.
/// Suitable for cases requiring unique instances based on parameters.

/// ⚠️ Important:
/// - **Synchronous state initialization** is mandatory.
/// - For async state, use `AsyncNotifier`.

class ManualCounterOnNotifier extends AutoDisposeFamilyNotifier<int, int> {
  @override
  int build(int arg) {
    ref.onDispose(() {
      debugPrint('[counterProviderOnNotifier] was disposed');
    });
    return arg;
  }

  void increment() => state++;
}

/// 📦 Exposes [ManualCounterOnNotifier] with `autoDispose` & `family` modifiers.
/// Provides unique instances per argument & auto-disposes when unreferenced.
final counterOnManualNotifierProvider = NotifierProvider.autoDispose
    .family<ManualCounterOnNotifier, int, int>(ManualCounterOnNotifier.new);
