import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/config/observer/extensions/async_value_xx.dart';

/// 📄 Logs debug information about an AsyncValue.
class AsyncValueLogger {
  /// 🐞 Logs debug information about weather state.
  static void log<T>(AsyncValue<T> asyncValue) {
    print(asyncValue.toString());
    print(asyncValue.props);

    try {
      print('value: ${asyncValue.value}');
    } catch (e) {
      print(e.toString());
    }

    print('valueOrNull: ${asyncValue.valueOrNull}');

    try {
      print('requireValue: ${asyncValue.requireValue}');
    } on StateError {
      print('StateError');
    } catch (e) {
      print(e.toString());
    }

    print('===========');
  }
}
