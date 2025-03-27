# ✅ Async Stream Providers in Riverpod

---

## 🔍 What Are Async Stream Providers?

In Riverpod, **async stream providers** enable you to manage **streams of asynchronous data** 
that emit values over time while also encapsulating business logic. Riverpod provides two main tools for handling streams:

1. `StreamProvider` – for simple use cases (read-only streaming).
2. `StreamNotifierProvider` – for streams with internal logic, mutation, or lifecycle awareness.

---

## 🚀 StreamProvider

### ✅ When to Use
- You just need to **listen to a stream** of values from a source.
- You do **not** need to perform custom logic inside the provider.
- Ideal for **simple, reactive subscriptions**.

### ✅ Example:
```dart
final tickerProvider = StreamProvider.autoDispose<int>((ref) async* {
  yield* Stream.periodic(const Duration(seconds: 1), (count) => count).take(10);
});
```

### ✅ Use Case Examples:
- Ticking counters or timers
- Listening to Firebase snapshots
- Real-time weather updates or sensor readings

---

## 🚀 StreamNotifierProvider

`StreamNotifierProvider` is a powerful and modern approach that is best used when you want 
to encapsulate **stream + business logic** in a single place.

### ✅ When to Use
- You need to **create a stream with internal state or methods**
- You want to **dynamically control** when the stream emits values
- You need **mutation methods** like `start()`, `pause()`, `reset()`

### ✅ Example:
```dart
@riverpod
class TimerController extends _$TimerController {
  Stream<int> _tick() async* {
    for (var i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Stream<int> build() => _tick();
}
```

---

## 🔁 Modifiers Available

Both `StreamProvider` and `StreamNotifierProvider` support:
- `.autoDispose` – dispose when no longer used
- `.family` – accept parameters to build dynamic streams

### Example with Parameters:
```dart
@riverpod
class CountDown extends _$CountDown {
  @override
  Stream<int> build(int from) async* {
    for (int i = from; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }
}
```

---

## 🔥 StreamProvider vs StreamNotifierProvider

| Feature                     | StreamProvider            | StreamNotifierProvider      |
|-----------------------------|---------------------------|-----------------------------|
| Async stream support        | ✅ Yes                    | ✅ Yes                      |
| Encapsulated logic          | ❌ No                     | ✅ Yes                      |
| Mutation methods            | ❌ No                     | ✅ Yes                      |
| State control               | ❌ No                     | ✅ Yes                      |
| Preferred for real-time UI  | ⚠️ Limited                | ✅ Yes                      |

---

## 🧠 Best Practices

- ✅ Use `StreamNotifierProvider` for **controlled, stateful** stream logic
- ✅ Use `autoDispose` to prevent memory leaks
- ✅ Use `.family` for parameterized streams
- ❌ Don’t expose bare streams to UI – wrap in providers
- ✅ Handle `AsyncValue` in UI with `.when()` or `switch`

### UI Example:
```dart
final timer = ref.watch(timerControllerProvider);

return timer.when(
  data: (value) => Text('Time: $value'),
  loading: () => CircularProgressIndicator(),
  error: (e, _) => Text('Error: $e'),
);
```

---

## ✅ Summary

Use **StreamProvider** for lightweight subscriptions, and switch to **StreamNotifierProvider** when you need:
- Business logic
- Stream control
- Internal methods like start/pause/reset

Together, they give you full flexibility to work with reactive, real-time data flows in your Flutter + Riverpod apps.

