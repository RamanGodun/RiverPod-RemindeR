# Riverpod `autoDispose + ref.keepAlive()` Pattern

## 🧠 Overview

The `autoDispose + ref.keepAlive()` pattern in **Riverpod** enables precise lifecycle control of providers,
allowing for memory-efficient caching and fine-tuned data retention.
It’s especially useful when working with **network-bound providers** that depend on other `autoDispose` providers 
(e.g., `dioProvider`).

---

## 🔍 Why Use This Pattern?

- Avoid memory leaks with `autoDispose`
- Retain valuable data temporarily with `ref.keepAlive()`
- Enable seamless back-navigation UX without re-fetching
- Cache expensive network requests after first success

---

## 🔄 Behavior Summary

| Concept           | Behavior                                                                 |
|------------------|--------------------------------------------------------------------------|
| `autoDispose`     | Disposes provider when no longer used. Saves memory.                    |
| `ref.keepAlive()` | Keeps **data cached** after initial fetch, even after disposal.         |
| `keepAlive: true` | Provider stays alive **indefinitely**, regardless of usage.             |

---

## 🔨 Usage Pattern

### ✅ Keep data **after** successful fetch (recommended)

```dart
@riverpod
FutureOr<User> userDetails(Ref ref, int id) async {
  final response = await ref.watch(dioProvider).get('/users/$id');

  // Keep cached after successful request
  ref.keepAlive();

  return User.fromJson(response.data);
}
```

### ✅ Keep alive **before** fetching

```dart
@riverpod
FutureOr<User> userDetailsEagerKeepAlive(Ref ref, int id) async {
  // Keeps provider alive even before data is fetched
  ref.keepAlive();

  final response = await ref.watch(dioProvider).get('/users/$id');
  return User.fromJson(response.data);
}
```

> Use the **first variant** in most cases to avoid unnecessary memory usage if user leaves before request completes.

---

## 📈 Practical Use Cases

- Detail pages (e.g., product/user/info pages)
- Lists with back-navigation (e.g., tap -> detail -> back)
- Conditional refresh: want cached version unless invalidated
- Combined with `.when()` or pattern matching for responsive UI

---

## 🧪 Full Example (Codegen Style)

```dart
@riverpod
FutureOr<User> withCodeGenerationUserDetails(Ref ref, int id) async {
  ref.onDispose(() {
    debugPrint('[userDetails($id)] disposed');
  });

  final response = await ref.watch(dioProvider).get('/users/$id');
  ref.keepAlive();
  return User.fromJson(response.data);
}
```

---

## ✅ Best Practices

| Best Practice                                  | Why It Matters                                                   |
|------------------------------------------------|------------------------------------------------------------------|
| Use `autoDispose` for all short-lived data     | Prevents memory leaks and stale data                             |
| Use `ref.keepAlive()` **after** data fetched   | Ensures cache is created only after a successful load            |
| Use `ref.onDispose()` for logging & debugging  | Tracks provider lifecycle during development                     |
| Don’t overuse `keepAlive: true`                | Keeps provider alive forever; may cause memory overhead          |

---

## 🧩 Comparison Table

| Pattern                    | Description                                                            |
|----------------------------|------------------------------------------------------------------------|
| `autoDispose` only         | Disposes as soon as no longer in use. Lightest footprint.              |
| `autoDispose + keepAlive()`| Smart caching. Keeps data after success, re-fetches after error.       |
| `keepAlive: true`          | Never disposed. Persistent memory usage, even if no longer needed.     |

---

## 🚀 Final Thoughts

The `autoDispose + ref.keepAlive()` combo is a **powerful pattern** in Riverpod for optimizing both **UX and performance**:

- Smooth navigation without re-fetching
- Controlled memory usage
- Simple to implement with `.keepAlive()`
- Remember, that every time the provider A (from which depends a Provider B) changes, Provider B (even when it is marked as "keepAlive: true")
 is disposed and recreated. This will cause the provider B to rebuild every time the Provider A changes.

> ✅ **Use this pattern when you want memory efficiency, but still need cache-like behavior for seamless user experience.**

