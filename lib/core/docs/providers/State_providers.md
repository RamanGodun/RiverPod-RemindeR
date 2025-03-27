# ✅ StateProvider in Riverpod

---

## 🔍 What is `StateProvider`?

`StateProvider` is the simplest form of provider in Riverpod. It allows you to manage **mutable synchronous state**
 — like counters, booleans, or any lightweight state value — inside your Flutter app.

> It acts like a wrapper around a single variable that can be read and updated reactively.

---

## 🧰 Use Cases

| Scenario                    | Use `StateProvider` When...                                            |
|-----------------------------|-------------------------------------------------------------------------|
| 🧮 Simple local state       | You need to store a boolean, int, double, or string                     |
| ⏱ Counter / toggles        | UI needs to respond to simple value changes (e.g. switch, checkbox)     |
| 🧩 Stateless form values    | You're managing simple form input values (e.g. dropdowns, filters)      |
| 🔄 Shared state across widgets | The value needs to be shared but doesn't require logic or async ops  |

---

## 📦 Syntax & Examples

### ✅ Defining a Provider
```dart
final counterProvider = StateProvider<int>((ref) => 0);
```

### ✅ Reading the Value
```dart
final counter = ref.watch(counterProvider);
```

### ✅ Updating the Value
```dart
ref.read(counterProvider.notifier).state++;
```

Or using update:
```dart
ref.read(counterProvider.notifier).update((value) => value + 1);
```

---

## 🚀 Best Practices

### ✅ Use `.notifier` to mutate state
Always update the state through the `notifier`. Avoid directly assigning state outside the provider.

### ✅ Keep logic outside widgets
Avoid performing mutations inside `build()` or widget constructors.

### ✅ Prefer derived computed providers for complex derived values
Don’t overuse `StateProvider` to derive values that could be handled with `Provider` or `Computed`.

---

## 🔄 Modifiers

Like other providers, `StateProvider` supports:

- `autoDispose` — dispose when unused
- `family` — accept external parameters
- `autoDispose.family` — combine both

### Example:
```dart
final nameProvider = StateProvider.autoDispose.family<String, int>((ref, userId) => '');
```

---

## 🧠 Comparison: When to Use `StateProvider`

| Goal                           | Recommended Provider       |
|--------------------------------|-----------------------------|
| Sync, simple state             | ✅ `StateProvider`          |
| Async logic                    | 🚫 Use `FutureProvider` / `AsyncNotifierProvider` |
| Business logic or side-effects | 🚫 Use `NotifierProvider`   |
| UI + async + caching           | 🚫 Use `AsyncNotifierProvider` |

---

## ⚠️ Limitations

- **Not suited for async workflows** — No built-in support for loading/error states.
- **Minimal encapsulation** — State and logic are not separated.
- **Not test-optimized** — Better use `Notifier`/`AsyncNotifier` for testable business logic.

---

## ✅ Summary

`StateProvider` is ideal for:

- Simple values that change over time
- Synchronous UI-driven state
- Stateless forms and UI controls

Avoid it when you need async workflows, complex transitions, or logic reuse — then use `Notifier` or `AsyncNotifier` instead.

> ✅ Use `StateProvider` for simplicity. Upgrade to more advanced providers as your logic grows.