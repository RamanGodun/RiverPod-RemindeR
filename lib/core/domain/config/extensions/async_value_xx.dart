import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Extension to provide additional utility methods for AsyncValue.
extension AsyncValueXX on AsyncValue {
  /// Returns a string representation of the AsyncValue state, including loading, value, and error states.
  String get toStr {
    final content = [
      if (isLoading && this is! AsyncLoading)
        'isLoading: $isLoading', // Logs if the state is loading
      if (hasValue) 'value: $value', // Logs the current value if available
      if (hasError) ...[
        'error: $error', // Logs the error message if present
      ],
    ].join(', ');

    // Return the runtime type and formatted content
    return '$runtimeType($content)';
  }

  /// Returns the key properties of AsyncValue in a more structured format.
  /// Includes details about loading, refreshing, reloading states, as well as value and error presence.
  String get props {
    return 'isLoading: $isLoading, isRefreshing: $isRefreshing, isReloading: $isReloading\nhasValue: $hasValue, hasError: $hasError';
  }
}
