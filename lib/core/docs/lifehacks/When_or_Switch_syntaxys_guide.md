# 🧮 AsyncValue Handling in Riverpod: `.when()` vs Dart 3 Pattern Matching

Handling `AsyncValue<T>` in Riverpod often boils down to choosing between two declarative approaches:

- `.when()` — ideal for clean, beginner-friendly UI logic.
- `switch-case` (with Dart 3 patterns) — ideal for fine-grained control and advanced behavior like showing previous values during refresh.

This guide walks through **when to use each**, their pros/cons, and practical code examples.

-----------------------------------------------------------------------------------------------------------------------

## ✅ When to Use `.when()`

Use `.when()` when:

- You want **simple, readable UI logic**, with **explicit separation** of loading/data/error phases.
- You need to control flags such as:
  - `skipLoadingOnRefresh`
  - `skipError`
- You don't need access to previous data or advanced branching.
- You prefer a clean 3-state handling model.

```dart
body: userList.when(
  skipLoadingOnRefresh: false,
  data: (users) => ..., // success
  loading: () => ...,  // loading
  error: (error, st) => ..., // error
),
```

### ⚠️ Limitations
- Slightly verbose when needing more granular control.
- Doesn't expose internals like `isRefreshing`, `previous`, or `requireValue()`.

-----------------------------------------------------------------------------------------------------------------------

## ✅ When to Use `switch (AsyncValue)`

Use Dart 3’s `switch-case` when:

- You want **modern pattern-matching syntax** (concise, expressive, scalable).
- You need to differentiate between **initial loading vs refresh**.
- You require access to `.requireValue`, `.valueOrNull`, or `previous` values.
- You want to **show previous data while refreshing** (e.g., with `LinearProgressIndicator`).
- You need to reuse widget logic across multiple states.

```dart
switch (userList) {
  AsyncData(:final value) when userList.isRefreshing => Stack(...),
  AsyncData(:final value) => ListView(...),
  AsyncError(:final error, :final stackTrace) => ErrorWidget(...),
  AsyncLoading() => LoadingWidget(),
}
```

### ✅ Benefits
- Clean branching with Dart 3 destructuring.
- More flexible handling of refresh and partial data.
- Seamless with sealed classes and future Dart enhancements.
- Suitable for cases where brevity & readability are preferred. Cleaner syntax when the widget tree is minimal and straightforward

### ⚠️ Notes
- Requires Dart 3.0+
- Slightly less beginner-friendly than `.when()`

-----------------------------------------------------------------------------------------------------------------------

## 🧩 When to Use `.maybeWhen()` or `.whenOrNull()`

- Use `.maybeWhen()` when handling only a **subset of states** (e.g., `data`) and want to ignore `error` or `loading`.
- Avoids boilerplate when default behavior is acceptable for unhandled states.

```dart
userList.maybeWhen(
  data: (value) => ..., // handle only data
  orElse: () => const SizedBox(),
)
```

-----------------------------------------------------------------------------------------------------------------------

## 📊 Comparison Table: `.when()` vs `switch`

| Feature / Need                           Use `.when()`                  Use `switch (AsyncValue)`          
|--------------------------------------|-----------------------------|-----------------------------------
| Simple 3-state mapping               | ✅ Yes                      | ⚠️ Verbose                         |
| Control refresh/previous value       | ❌ No                       | ✅ Yes                             |
| Use `isRefreshing`, `requireValue`   | ❌ No                       | ✅ Yes                             |
| Clean pattern-based branching        | ⚠️ Limited                  | ✅ Yes                             |
| Use `skipLoadingOnRefresh` flag      | ✅ Yes                      | ❌ Manual                          |

-----------------------------------------------------------------------------------------------------------------------

## ✅ Best Practice Tip

> Use `.when()` for **straightforward UI rendering** with loading/error/success.
>
> Use `switch (AsyncValue)` when you need **advanced customization**, **partial updates**, or are working with **refresh logic and previous state fallback**.

-----------------------------------------------------------------------------------------------------------------------