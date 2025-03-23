# 📌 Provider Observer in Riverpod

## 🔍 Overview

This document describes how to implement a **Provider Observer** in **Flutter Riverpod** to log lifecycle events, including provider initialization, state changes, and disposal.

---

## 🚀 Implementation Steps

### **1️⃣ Create `logger.dart` file**

Create a new file `logger.dart` and implement the `ProviderObserver` class:

```dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 📌 Logger for Riverpod Providers
/// - Logs lifecycle events for providers (added, updated, disposed).
/// - Uses `debugPrint` for optimized performance.
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

    /// ✅ Logs errors if `newValue` is `AsyncError`
    if (newValue is AsyncError) {
      _logError(provider, newValue.error, newValue.stackTrace);
    }

    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  /// 📌 Helper method for logging events
  void _logEvent(String eventType, Map<String, String> data) {
    debugPrint(jsonEncode({
      "event": eventType,
      "timestamp": DateTime.now().toIso8601String(),
      "details": data,
    }));
  }

  /// 🚨 Logs provider errors
  void _logError(ProviderBase<Object?> provider, Object error, StackTrace? stackTrace) {
    debugPrint(jsonEncode({
      "event": "Provider Error",
      "timestamp": DateTime.now().toIso8601String(),
      "details": {
        "provider": provider.name ?? provider.runtimeType.toString(),
        "error": error.toString(),
        "stackTrace": stackTrace?.toString() ?? "No StackTrace",
      },
    }));
  }
}
```

---

### **2️⃣ Use `Logger` in `main.dart`**

Modify `main.dart` to integrate the `Logger` observer:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/logger.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MyApp(),
    ),
  );
}
```

---

### **3️⃣ Run and Monitor Logs**

After running the application, observe logs in the **debug console**. Example output:

```json
{
  "event": "Provider Initialized",
  "timestamp": "2025-03-13T13:45:10.456Z",
  "details": {
    "provider": "themeProvider",
    "value": "ThemeMode.light"
  }
}
```

```json
{
  "event": "Provider Updated",
  "timestamp": "2025-03-13T13:45:15.789Z",
  "details": {
    "provider": "futureWeatherProvider",
    "previousValue": "Loading",
    "newValue": "WeatherData(20°C, Sunny)"
  }
}
```

```json
{
  "event": "Provider Error",
  "timestamp": "2025-03-13T13:45:20.123Z",
  "details": {
    "provider": "futureWeatherProvider",
    "error": "SocketException: Failed to connect",
    "stackTrace": "..."
  }
}
```

---

## 🔥 **Key Features of this Observer**

✅ Logs provider initialization, updates, and disposal.  
✅ Detects errors automatically and logs them separately.  
✅ Uses `debugPrint` to optimize console performance.  
✅ Provides structured JSON output for easy debugging.  
✅ Supports named providers (`provider.name`) or fallback to runtime type.

🚀 **Now, your Riverpod app has a powerful logging mechanism!**
