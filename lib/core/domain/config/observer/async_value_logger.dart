import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/config/observer/extensions/async_value_xx.dart';

/// 📄 Logs debug information about an AsyncValue.
class AsyncValueLogger {
  /// 🐞 Logs debug information about weather state.
  static void log<T>(AsyncValue<T> asyncValue) {
    debugPrint(asyncValue.toString());
    debugPrint(asyncValue.props);

    try {
      debugPrint('value: ${asyncValue.value}');
    } catch (e) {
      debugPrint(e.toString());
    }

    debugPrint('valueOrNull: ${asyncValue.valueOrNull}');

    try {
      debugPrint('requireValue: ${asyncValue.requireValue}');
    } on StateError {
      debugPrint('StateError');
    } catch (e) {
      debugPrint(e.toString());
    }

    debugPrint('===========');
  }
}
