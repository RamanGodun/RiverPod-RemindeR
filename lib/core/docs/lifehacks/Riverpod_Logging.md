# ✨ Riverpod Logging Guide: Observers, AsyncValue Extensions, and Lifecycle Debugging

This guide covers **professional techniques** for logging and debugging Riverpod applications using:

- `ProviderObserver` for lifecycle event tracking
- `AsyncValueXX` extension for state debugging
- `debugPrint` for structured logs
- Lifecycle hooks (`onDispose`, `onCancel`, `onResume`) for advanced observability

---

## 🔍 Why Logging Matters in Riverpod

Riverpod's declarative, reactive nature means state changes happen implicitly. Logging helps you:

- Debug provider rebuilds and state transitions
- Trace errors with complete context
- Optimize provider lifecycle management

---

## 📂 1. Setting Up a Global Provider Logger

A custom `ProviderObserver` class captures lifecycle events of **all** providers:

### ✅ Features:
- Detects `add`, `update`, `dispose` events
- Detects `AsyncError` for failed async providers
- Pretty-prints JSON logs with timestamps

### 🔄 Logger Implementation
```dart
class Logger extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    _logEvent("Provider Initialized", {
      "provider": provider.name ?? provider.runtimeType.toString(),
      "value": value?.toString() ?? "null",
    });
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    _logEvent("Provider Disposed", {
      "provider": provider.name ?? provider.runtimeType.toString(),
    });
    super.didDisposeProvider(provider, container);
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    _logEvent("Provider Updated", {
      "provider": provider.name ?? provider.runtimeType.toString(),
      "previousValue": previousValue?.toString() ?? "null",
      "newValue": newValue?.toString() ?? "null",
    });

    if (newValue is AsyncError) {
      _logError(provider, newValue.error, newValue.stackTrace);
    }

    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  void _logEvent(String eventType, Map<String, String> data) {
    debugPrint(_formatLogOutput({
      "event": eventType,
      "timestamp": _formattedTimestamp(),
      "details": data,
    }));
  }

  void _logError(ProviderBase<Object?> provider, Object error, StackTrace? stackTrace) {
    debugPrint(_formatLogOutput({
      "event": "Provider Error",
      "timestamp": _formattedTimestamp(),
      "details": {
        "provider": provider.name ?? provider.runtimeType.toString(),
        "error": error.toString(),
        "stackTrace": stackTrace?.toString() ?? "No StackTrace",
      },
    }));
  }

  String _formattedTimestamp() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  String _formatLogOutput(Map<String, dynamic> logData) {
    return const JsonEncoder.withIndent("  ").convert(logData);
  }
}
```

### ⚖️ Registering the Logger
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      observers: [Logger()],
      overrides: [sharedPreferencesProvider.overrideWithValue(sharedPrefs)],
      child: const MyApp(),
    ),
  );
}
```

---

## 📊 2. Debugging with `AsyncValueXX` Extensions

You can add custom extension methods to `AsyncValue` to simplify logging and diagnostics:

### ➕ Extension
```dart
extension AsyncValueXX on AsyncValue {
  String get toStr {
    final content = [
      if (isLoading && this is! AsyncLoading) 'isLoading: $isLoading',
      if (hasValue) 'value: $value',
      if (hasError) 'error: $error',
    ].join(', ');
    return '$runtimeType($content)';
  }

  String get props {
    return 'isLoading: $isLoading, isRefreshing: $isRefreshing, isReloading: $isReloading\n'
           'hasValue: $hasValue, hasError: $hasError';
  }
}
```

### 📅 Usage Example
```dart
debugPrint("weatherState: ${ref.watch(weatherProvider).toStr}");
debugPrint("weatherState Props: ${ref.watch(weatherProvider).props}");
```

---

## ♻️ 3. Lifecycle Logging with Hooks

For deeper observability, use `ref.onDispose`, `ref.onCancel`, `ref.onResume`:

```dart
@riverpod
FutureOr<List<Item>> fetchItems(Ref ref) async {
  ref.onDispose(() => debugPrint('[fetchItems] disposed'));
  ref.onCancel(() => debugPrint('[fetchItems] canceled'));
  ref.onResume(() => debugPrint('[fetchItems] resumed'));

  final result = await api.getItems();
  return result;
}
```

---

## 📄 Best Practices Summary

| Feature                              | Why Use It                                           |
|--------------------------------------|------------------------------------------------------|
| `ProviderObserver`                   | Track global provider lifecycle                      |
| `AsyncValueXX` extensions            | Simplify debug output of async states                |
| `onDispose`, `onCancel`, `onResume`  | Observe lifecycle per-provider                       |
| `debugPrint(jsonEncode(...))`        | Format structured logs for clarity                   |
| Named providers                      | Easier debugging in observer logs                    |

---

## ✅ Conclusion

Logging with Riverpod goes beyond `print()`. Use structured observers, lifecycle hooks, and value extensions 
to create a **robust, traceable**, and **debuggable** state management experience.

> ⚡ The more observable your state, the more maintainable and scalable your app becomes.