import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 🔄 **Extension providing helpful methods for debugging AsyncValue states.**
extension AsyncValueXX on AsyncValue {
  /// 📌 Returns a readable string representation of the AsyncValue state.
  /// Includes loading status, value, and error (if any).
  String get toStr {
    final content = [
      if (isLoading && this is! AsyncLoading)
        'isLoading: $isLoading', // Logs loading status (when not a typical loading state)
      if (hasValue) 'value: $value', // Logs current value
      if (hasError) 'error: $error', // Logs error message
    ].join(', ');

    return '$runtimeType($content)';
  }

  /// 📊 Returns key AsyncValue properties in a structured format.
  /// Shows loading, refreshing, value, and error flags.
  String get props {
    return 'isLoading: $isLoading, isRefreshing: $isRefreshing, isReloading: $isReloading\nhasValue: $hasValue, hasError: $hasError';
  }
}
