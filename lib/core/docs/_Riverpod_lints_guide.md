# ✅ Riverpod Lint & Best Practices Guide

This guide summarizes common Riverpod-specific lint warnings, explains why they appear, and offers **best practices** to ensure clean, scalable, and maintainable code when working with Riverpod v2 (manual + codegen).

---

## ⚠️ Avoid Using Manual Providers as Dependencies in Generated Providers

### 🔹 Lint:
```dart
// ignore: avoid_manual_providers_as_generated_provider_dependency
final value = ref.watch(manualProvider);
```

### 🔹 Why It Matters:
- Mixing manual and generated providers **breaks type-safety** and can cause **circular dependencies**.
- Generated providers (via `@riverpod`) are resolved at compile time — referencing runtime-declared manual providers can lead to unintended rebuilds.

### ✅ Recommendation:
- Always use **generated providers** as dependencies inside other generated providers.
- If you need to bridge a manual provider, wrap it as a generated provider.

---

## ⚠️ Avoid Public Properties in Notifiers

### 🔹 Lint:
```dart
// ignore: avoid_public_notifier_properties
final int internalVar = 10;
```

### 🔹 Why It Matters:
- Public fields inside Notifiers break encapsulation.
- These values become **accessible outside**, which leads to fragile state.

### ✅ Recommendation:
- Always **use private fields** (prefix with `_`) inside `Notifier`/`AsyncNotifier`.
- Expose any needed values through **getters** or computed state instead.

---

## ⚠️ Avoid Non-Const or Non-Equatable Provider Parameters

### 🔹 Lint:
```dart
ref.watch(myProvider(MyClass()));
```

### 🔹 Why It Matters:
- If provider parameters are **mutable or non-equatable**, Riverpod **can't memoize** them.
- This causes **duplicate instances** of the provider to be created.

### ✅ Recommendation:
- Use:
  - `const` constructors
  - Or classes that extend `Equatable`
  - Or override `==` and `hashCode`

### ✅ Tip:
Use `Equatable` for value types to ensure proper caching:
```dart
class Params extends Equatable {
  final int id;
  const Params(this.id);
  @override
  List<Object?> get props => [id];
}
```

---

## 🧠 Other Recommended Practices

### ✅ Prefer Code Generation with `@riverpod`
- Reduces boilerplate
- Enables better tooling (intellisense, refactor-safe names)
- Forces purity in provider definitions

### ✅ Use `.ref` only inside the `build()` method
- Avoid side-effects in constructor/init

### ✅ Use `ref.read()` sparingly
- Prefer `ref.watch()` for reactive patterns
- Use `read` only for fire-and-forget or event-based interactions

### ✅ Use `AsyncNotifier` over `FutureProvider` for side-effect flows
- Better control over error/loading/success states
- Can maintain state between fetches

### ✅ Use `Notifier` for sync state with logic
- More powerful than `StateProvider`
- Allows separation of logic and state

### ✅ Use `ref.onDispose()` and `ref.onCancel()` for cleanup
- Essential for timers, subscriptions, or logging

### ✅ Avoid Side Effects in `build()` unless memoized
- Use `ref.cacheFor` or `AsyncValue.guard()` if needed

---

## 📌 Summary of Lint Ignores in Provided Code

| Lint Warning                                              | Example File                          | Fix Recommendation                       |
|-----------------------------------------------------------|---------------------------------------|------------------------------------------|
| `avoid_manual_providers_as_generated_provider_dependency` | avoid_man_as_gen_dependency.dart      | Convert `depProvider` to `@riverpod`     |
| `avoid_public_notifier_properties`                        | avoid_public_notifier_properties.dart | Make fields private (`_internalVar`)     |
| `provider_parameters`                                     | provider_parameters.dart              | Use const/Equatable params in providers  |

---

> ✅ Applying these practices will result in **safer**, **faster**, and **easier-to-maintain** Riverpod apps — fully leveraging Dart’s modern capabilities and Riverpod’s design philosophy.

