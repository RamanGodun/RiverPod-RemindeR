import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/todo_model_immutable.dart';

/// 📝 A [StateNotifier] that manages a list of immutable [Todo] objects.
/// Each state update returns a new list, ensuring predictable & testable state.
class TodosOnStateNotifier extends StateNotifier<List<Todo>> {
  /// Initializes with an empty todo list.
  TodosOnStateNotifier() : super([]);

  /// Adds a new [Todo] using the [Todo.add] factory (generates unique `id`).
  void addTodo(String description) {
    state = [...state, Todo.add(description: description)];
  }

  /// Toggles the `completed` status of a [Todo] by its `id`.
  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  /// Removes a [Todo] by filtering out its `id`.
  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

/// 📦 [todosOnStateNotifierProvider] provides access to [TodosOnStateNotifier] and its immutable todo list.
/// Easily extendable with `.autoDispose`, `.family`, etc.
final todosOnStateNotifierProvider =
    StateNotifierProvider<TodosOnStateNotifier, List<Todo>>(
      (ref) => TodosOnStateNotifier(),
    );
