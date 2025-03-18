# 📝 Riverpod Providers Commenting Guideline

## General Principles:
- **Consistency first**: Use uniform comment structure across all provider types.
- **Informative, but concise**: Keep descriptions clear without unnecessary duplication.
- **Key focus points:**
  - **What the provider/class does**
  - **Core responsibilities**
  - **How state is updated (immutability/mutability)**
  - **Notifier mechanisms: notifyListeners / state reassignment**
  - **Advanced usage (modifiers: autoDispose, family)**

---

## 🔷 `StateNotifier` Example

```dart
/// `TodosOnStateNotifier` is a `StateNotifier` that manages a list of immutable `Todo` objects.
///
/// Each state update produces a new immutable list, ensuring predictable and easily testable state management.
class TodosOnStateNotifier extends StateNotifier<List<Todo>> {
  /// Initializes the `TodosOnStateNotifier` with an empty list of todos.
  TodosOnStateNotifier() : super([]);

  /// Adds a new `Todo` to the list.
  /// Uses `Todo.add` factory to generate unique `id`.
  /// Updates state immutably by creating a new list with the added task.
  void addTodo(String description) {
    state = [...state, Todo.add(description: description)];
  }

  /// Toggles the `completed` status of a `Todo` by its `id`.
  /// Produces a new list where only the targeted `Todo` is modified.
  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  /// Removes a `Todo` by its `id` and updates state immutably.
  void removeTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo,
    ];
  }
}

/// `todosOnStateNotifierProvider` exposes `TodosOnStateNotifier` to the app.
/// Allows widgets to interact with todos immutably.
/// Modifiers like `autoDispose` or `family` can be added for advanced use cases.
final todosOnStateNotifierProvider =
    StateNotifierProvider<TodosOnStateNotifier, List<Todo>>((ref) {
  return TodosOnStateNotifier();
});
```

---

## 🔷 `ChangeNotifier` Example

```dart
/// `TodosOnChangeNotifier` is a `ChangeNotifier` managing a list of mutable `Todo` objects.
///
/// Provides methods for adding, toggling, and removing `Todo` items.
/// Notifies listeners on state changes using `notifyListeners()`.
class TodosOnChangeNotifier extends ChangeNotifier {
  final List<Todo> _todos = [];

  /// Public getter for todos list.
  List<Todo> get todos => _todos;

  /// Adds a new `Todo` and notifies listeners.
  void addTodo(String description) {
    _todos.add(Todo.add(description: description));
    notifyListeners();
  }

  /// Toggles `completed` status of a `Todo` by `id` and notifies listeners.
  void toggleTodo(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }

  /// Removes a `Todo` by `id` and notifies listeners.
  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

/// `todosOnChangeNotifierProvider` exposes `TodosOnChangeNotifier` to the app.
/// Allows widgets to interact with mutable todos list.
/// Modifiers like `autoDispose` or `family` can be added if needed.
final todosOnChangeNotifierProvider =
    ChangeNotifierProvider<TodosOnChangeNotifier>((ref) {
  return TodosOnChangeNotifier();
});
```

---

## 🔷 `FutureProvider` Example

```dart
/// `userDetailsFutureProvider` is a `FutureProvider` that fetches a single user's details by ID.
///
/// This provider is `autoDispose` by default, meaning it will be disposed when no widgets use it.
///
/// Can be extended with `.keepAlive()` if data caching is desired.
final userDetailsFutureProvider = FutureProvider.autoDispose.family<User, int>((ref, id) async {
  ref.onDispose(() => debugPrint('[userDetailsFutureProvider($id)] disposed'));

  final apiClient = ref.watch(apiClientProvider);
  final user = await apiClient.getUser(id);

  ref.keepAlive(); // Optional caching to keep data alive.
  return user;
});
```

---

## 🔷 `StreamProvider` Example

```dart
/// `tickerStreamProvider` is a `StreamProvider` that emits integer values periodically.
///
/// It autoDisposes when no widgets listen to it. Add `keepAlive: true` if persistent behavior is required.
final tickerStreamProvider = StreamProvider.autoDispose<int>((ref) {
  ref.onDispose(() => debugPrint('[tickerStreamProvider] disposed'));

  return Stream.periodic(const Duration(seconds: 1), (count) => count + 1).take(100);
});
```

---

## ✅ Summary Checklist:
- Brief overview of provider/class purpose.
- Clear method-level comments.
- Mention immutability/mutability explicitly.
- Describe notification mechanism (notifyListeners, state reassignment).
- Clarify advanced options (autoDispose, family, keepAlive).

Would you like me to prepare a **ready-to-use template file** for new providers based on this guideline?