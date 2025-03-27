# ✅ Stream Providers in Riverpod

---

## 🔍 What is a `StreamProvider`?

`StreamProvider` in Riverpod is a provider type built to handle **asynchronous data streams**.
It listens to a `Stream<T>` and exposes its current state as an `AsyncValue<T>`, giving access to real-time data
 with built-in handling for `loading`, `data`, and `error` states.

> Unlike `FutureProvider`, which resolves once, `StreamProvider` continuously listens and emits new values over time.

---

## 🔁 Core Use Cases

| Scenario                        | Use `StreamProvider` When...                                                          |
|---------------------------------|---------------------------------------------------------------------------------------|
| 📡 Real-time data updates       | You receive data that changes over time (e.g. chat, prices, sensors, notifications)   |
| 🔄 Continuous data flow         | You need to continuously observe data (e.g. Firestore snapshots, file watchers)       |
| 📦 External stream source       | You're consuming 3rd party stream-based APIs (e.g. socket streams, sensors)           |


---

## 🧰 Key Features

- Exposes data as `AsyncValue<T>` → declarative UI updates
- Supports `autoDispose`, `family`, and combination with other providers
- Automatically manages subscriptions and disposal (especially when using `autoDispose`)

---

## ✅ Basic Implementation

```dart
final tickerProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (count) => count).take(10);
});
```

```dart
final value = ref.watch(tickerProvider);

return value.when(
  data: (count) => Text('Count: $count'),
  loading: () => const CircularProgressIndicator(),
  error: (e, _) => Text('Error: $e'),
);
```

---

## 🔩 Variants & Modifiers

You can use all the standard Riverpod modifiers:

- `StreamProvider.autoDispose`
- `StreamProvider.family`
- `StreamProvider.autoDispose.family`

### Example with Parameters:
```dart
final weatherStreamProvider = StreamProvider.autoDispose.family<Weather, String>((ref, city) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 2));
    yield await api.getWeather(city);
  }
});
```

---

## ⚠️ Best Practices

### ✅ Use `autoDispose`
- Prevents memory leaks when the stream is no longer in use

### ✅ Handle Errors Gracefully
- Always provide fallback UI for `.error` case

### ✅ Combine with `ref.onDispose()` if you need to clean up additional resources

---

## 🧠 StreamProvider vs FutureProvider

| Feature                       | `StreamProvider`              | `FutureProvider`              |
|-------------------------------|-------------------------------|-------------------------------|
| Emits multiple values         | ✅ Yes                        | ❌ Only one (single future)   |
| Best for real-time updates    | ✅ Yes                        | ❌ No                         |
| Automatic state management    | ✅ Yes                        | ✅ Yes                        |
| Cancellation/disposal         | ✅ (autoDispose)              | ✅ (autoDispose)              |

---

## ✅ When to Use `StreamNotifierProvider`

`StreamNotifierProvider` is a more powerful, logic-rich alternative to `StreamProvider`. Use it when:

- You need **business logic** inside your stream lifecycle (pause/resume/reset)
- You want to emit **different states** (sealed classes or enums)
- You want **methods** inside your stream provider

### Example:
```dart
@riverpod
class TickerStream extends _$TickerStream {
  @override
  Stream<int> build() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
}
```

> Use `StreamProvider` for simple read-only use cases.
> Use `StreamNotifierProvider` when you need **more control, logic, or flexibility**.

---

## ✅ Summary

| Type                     | Description                                                     |
|--------------------------|-----------------------------------------------------------------|
| `StreamProvider`         | Simple stream handler for real-time data                        |
| `StreamNotifierProvider` | Enhanced stream logic with full business logic & method support |

> Choose the right one depending on whether you just need data, or full lifecycle logic.

✅ Clean
✅ Real-time
✅ Ideal for reactive UIs