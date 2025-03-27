# ✅ FutureProvider in Riverpod

---

## 🔍 What is `FutureProvider`?

`FutureProvider` is a **declarative Riverpod provider** used for managing simple asynchronous computations 
like API calls, DB reads, or file access. It is ideal when you **don’t need to manage internal state or mutations**, 
and just want to display or react to a single async operation.

It exposes an `AsyncValue<T>` object representing one of three possible states:
- `loading`
- `data`
- `error`

---

## 🧰 Use Cases

| Scenario                         | Use `FutureProvider` When...                                                                |
|----------------------------------|---------------------------------------------------------------------------------------------|
| 🔄 One-time data fetch           | You want to call an API or load data only once when the widget is created                   |
| 🧭 Stateless async logic         | You don’t need to expose methods like `.fetch()` or `.retry()`                              |
| 🛡 Pure UI-driven state          | You only care about loading/data/error UI states without side effects                       |
| 🔁 Refreshable API calls         | You want to allow `ref.invalidate()` or `ref.refresh()` logic                               |
| 💡 Replace `initState + setState`| You want a **cleaner, declarative** alternative to manual loading + error handling          |

> ✅ For more advanced flows (retry, optimistic UI, caching), use `AsyncNotifierProvider`.

---

## ✨ Syntax Overview

### ✅ Defining a Simple `FutureProvider`
```dart
final weatherProvider = FutureProvider<Weather>((ref) async {
  final api = ref.watch(weatherApiProvider);
  return api.fetchWeather();
});
```

### ✅ Using it in UI
```dart
final weather = ref.watch(weatherProvider);

return weather.when(
  data: (value) => Text('Temp: °${value.temp}'),
  loading: () => const CircularProgressIndicator(),
  error: (e, _) => Text('Error: $e'),
);
```

---

## 📦 `AsyncValue<T>` Recap

The state exposed by `FutureProvider` is always an `AsyncValue<T>`:

- `AsyncLoading()`
- `AsyncData(value)`
- `AsyncError(error, stackTrace)`

### ✅ Declarative `.when()` Method
```dart
weather.when(
  data: ...,   // success
  loading: ..., // loading spinner
  error: ...,   // error fallback
)
```

### ✅ Or Dart 3 `switch` Pattern Matching
```dart
switch (weather) {
  case AsyncData(:final value): return Text(value.title);
  case AsyncLoading(): return CircularProgressIndicator();
  case AsyncError(:final error): return Text('Error: $error');
}
```

---

## 🔁 Refresh & Invalidate

### ✅ `ref.invalidate()`
- Marks the provider as dirty
- Re-executes on next frame
- **Safer** for UI interactions (e.g., AppBar refresh)

### ✅ `ref.refresh()`
- Immediately re-executes and returns the new result
- **Useful** for imperative logic

> 📌 Both are great for pull-to-refresh, retry, or manual reload scenarios.

```dart
ref.invalidate(weatherProvider);
```

```dart
final newWeather = await ref.refresh(weatherProvider.future);
```

---

## 🚫 Limitations

| Limitation                       | Why?                                                                 |
|----------------------------------|----------------------------------------------------------------------|
| No mutation support              | Cannot expose `.increment()` or similar logic                        |
| No state reuse                   | No built-in way to preserve previous value during refresh            |
| Limited business logic           | Difficult to express retry or complex UI fallback logic              |
| One-time execution               | Designed to resolve once, unlike `StreamProvider` or Notifier        |

> ✅ Prefer `AsyncNotifierProvider` for anything beyond one-off loading logic.

---

## ✅ Best Practices

- ✅ Use `.when()` or `switch` for clean UI state management
- ✅ Use `ref.invalidate()` or `ref.refresh()` instead of manual future calls
- ✅ Wrap error-prone logic in `AsyncValue.guard()` if needed
- ✅ Combine with `autoDispose` for memory safety in temp widgets
- ❌ Avoid doing business logic in `FutureProvider`, it's meant for **declarative data access**

---

## 📌 Summary Table

| Feature                                 | Supported by `FutureProvider` |
|-----------------------------------------|-------------------------------|
| Async Initialization                    | ✅ Yes                        |
| Declarative UI integration              | ✅ Yes                        |
| `AsyncValue<T>` support (`when`, etc)   | ✅ Yes                        |
| Refresh & Invalidate support            | ✅ Yes                        |
| State mutation methods                  | ❌ No                      |
| Previous state preservation             | ❌ No                      |
| Retry logic / retry counter             | ❌ No                      |

---

## ✅ Final Recommendation

Use `FutureProvider` for **simple async read-only tasks** like:
- Loading user profile on startup
- Fetching config or remote settings
- Lightweight one-shot API calls

If you need:
- **Retry logic**
- **State transitions**
- **Mutable async flows**

> ❌ Don’t force complex workflows into `FutureProvider`.  
> ✅ Migrate to `AsyncNotifierProvider` for better scalability and testability.