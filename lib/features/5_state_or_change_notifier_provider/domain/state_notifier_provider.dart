import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/todo_model_immutable.dart';

/// `TodosOnStateNotifier` is a `StateNotifier` that manages a list of immutable `Todo` objects.
///
/// Each state update produces a new immutable list, ensuring predictable and easily testable state management.
class TodosOnStateNotifier extends StateNotifier<List<Todo>> {
  /// Initializes the `TodosOnStateNotifier` with an empty list of todos.
  TodosOnStateNotifier() : super([]);

  /// The new `Todo` is created using the `Todo.add` factory constructor, which generates a unique `id` for each task.
  /// The state is updated immutably by creating a new list with the added task.
  void addTodo(String description) {
    state = [...state, Todo.add(description: description)];
  }

  /// Finds the `Todo` with the specified `id` and creates a copy with the `completed` field toggled.
  /// Updates the state with a new list where only the target `Todo` is modified.
  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  /// Filters out the Todo with the specified id and updates the state immutably to exclude the removed Todo.
  void removeTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo,
    ];
  }
}

/// `todosOnStateNotifierProvider` is a `StateNotifierProvider` that exposes `TodosOnStateNotifier` to the app.
///
/// Any widget can watch or interact with the list of todos through this provider,
/// leveraging `StateNotifier`'s methods to manage state immutably.
/// This provider can be enhanced with modifiers like `autoDispose` or `family` for advanced use cases.
final todosOnStateNotifierProvider =
    StateNotifierProvider<TodosOnStateNotifier, List<Todo>>((ref) {
      return TodosOnStateNotifier();
    });
