import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// 📄 **[Logger] — Custom ProviderObserver for Riverpod Providers**
/// - Logs provider lifecycle events (add, update, dispose).
/// - Pretty-prints structured logs in JSON format.
class Logger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    _logEvent("Provider Initialized", {
      "provider": provider.name ?? provider.runtimeType.toString(),
      "value": value?.toString() ?? "null",
    });
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    _logEvent("Provider Disposed", {
      "provider": provider.name ?? provider.runtimeType.toString(),
    });
    super.didDisposeProvider(provider, container);
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _logEvent("Provider Updated", {
      "provider": provider.name ?? provider.runtimeType.toString(),
      "previousValue": previousValue?.toString() ?? "null",
      "newValue": newValue?.toString() ?? "null",
    });

    // 🔔 Log error if AsyncError occurred
    if (newValue is AsyncError) {
      _logError(provider, newValue.error, newValue.stackTrace);
    }

    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  /// 🟢 **General event logger**
  void _logEvent(String eventType, Map<String, String> data) {
    print(
      _formatLogOutput({
        "event": eventType,
        "timestamp": _formattedTimestamp(),
        "details": data,
      }),
    );
  }

  /// 🔴 **Error logger**
  void _logError(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace? stackTrace,
  ) {
    print(
      _formatLogOutput({
        "event": "Provider Error",
        "timestamp": _formattedTimestamp(),
        "details": {
          "provider": provider.name ?? provider.runtimeType.toString(),
          "error": error.toString(),
          "stackTrace": stackTrace?.toString() ?? "No StackTrace",
        },
      }),
    );
  }

  /// 🕒 **Formats timestamp into readable format**
  String _formattedTimestamp() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  /// 🖨 **Formats output as pretty JSON**
  String _formatLogOutput(Map<String, dynamic> logData) {
    return const JsonEncoder.withIndent("  ").convert(logData);
  }
}
