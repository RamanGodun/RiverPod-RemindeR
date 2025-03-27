# ✅ AsyncValue in Riverpod


## 🔍 What is `AsyncValue`?

`AsyncValue<T>` is a **sealed, immutable, and declarative state container** built into Riverpod. 
It is specifically designed to represent the lifecycle of **asynchronous operations**, such as loading data from an API, 
performing background work, or reacting to complex async streams.

It supports exactly three states:

- `AsyncLoading()` – when the operation is in progress
- `AsyncData<T>(value)` – when the operation succeeds
- `AsyncError(error, stackTrace)` – when the operation fails

> This model ensures **every possible async outcome is explicitly represented** and safely handled.

---

## 📦 Why Use `AsyncValue`?

| Benefit                           | Description                                                                 |
|-----------------------------------|-----------------------------------------------------------------------------|
| ✅ Safe async UI rendering        | Avoids null checks, race conditions, or missing states                      |
| ✅ Declarative state handling     | Easily consumed via `.when()`, `.maybeWhen()`, or Dart 3 `switch-case`      |
| ✅ Consistent error handling      | Forces every async flow to handle error + loading states                    |
| ✅ Sync access to async result    | `.value`, `.requireValue`, `.valueOrNull`                                   |
| ✅ Immutability & thread-safety   | Prevents accidental mutation or leaks                                       |

---

## 🔩 Core API of `AsyncValue`

### ✅ Constructors / States
```dart
const AsyncLoading();
const AsyncData(value);
const AsyncError(error, [stackTrace]);
```

### ✅ Common Accessors
```dart
final value = asyncValue.valueOrNull; // nullable safe
final value = asyncValue.requireValue; // throws if error/loading

final isLoading = asyncValue.isLoading;
final isRefreshing = asyncValue.isRefreshing;
final hasError = asyncValue.hasError;
final hasValue = asyncValue.hasValue;
```

### ✅ Built-in Render Helpers
```dart
asyncValue.when(
  data: (data) => ..., 
  loading: () => ..., 
  error: (e, st) => ...,
);
```

```dart
switch (asyncValue) {
  case AsyncLoading(): return ...;
  case AsyncData(:final value): return ...;
  case AsyncError(:final error): return ...;
}
```

---

## 🧠 Advanced Usage Tips

### 🔁 Preserving Previous Data
`AsyncValue` automatically retains previous data when transitioning to `loading` or `error`:
```dart
if (state.isRefreshing) {
  final old = state.value;
  // Show old data with loading overlay
}
```

### 🧪 Logging & Debugging
```dart
final props = state.props;
final summary = state.toStr;
```
These custom extensions (can be added manually) help debug and log AsyncValue efficiently.

---

## 💡 Best Practices

- ✅ Always render `AsyncValue` with `.when()` or `switch`.
- ✅ Use `.guard()` for async error safety:
```dart
state = await AsyncValue.guard(() => fetchData());
```
- ✅ Preserve old state during refresh manually if needed.
- ❌ Avoid accessing `.value` directly unless you're 100% sure it's available.

---

## 🔄 When to Use `AsyncValue`

| Scenario                       | Use `AsyncValue` When...                                    |
|--------------------------------|-------------------------------------------------------------|
| Async API/data fetching        | Handle `loading`, `success`, `error` in one model           |
| Stateful async transitions     | Retain previous data between updates                        |
| Declarative UI flow            | Map states to UI widgets safely and cleanly                 |
| Robust error management        | Handle network failures, parse errors, etc. without crashes |

---

## 📌 Summary

`AsyncValue<T>` is the **foundation for async state handling in Riverpod**. It brings structure, safety,
 and clarity to every data-fetching flow, ensuring developers always consider success, loading, and error as first-class states.

> Mastering `AsyncValue` is essential for writing clean, safe, and reactive Flutter apps with Riverpod.