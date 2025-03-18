import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/todo_model_immutable.dart';

/// A `StateNotifier` that manages a list of immutable `Todo` objects.
/// Each state update results in a new immutable list, ensuring that the state
/// is predictable and easy to manage.
class TodosOnStateNotifier extends StateNotifier<List<Todo>> {
  /// Initializes the `TodosNotifier` with an empty list of todos.
  TodosOnStateNotifier() : super([]);

  /// Adds a new `Todo` to the list.
  ///
  /// The new `Todo` is created using the `Todo.add` factory constructor, which
  /// generates a unique `id` for each task. The state is then updated with the
  /// new list of todos, ensuring immutability by creating a new list with the
  /// added task.
  void addTodo(String description) {
    state = [...state, Todo.add(description: description)];
    // print('in addTodo: $state');
  }

  /// Toggles the `completed` status of a `Todo` by its `id`.
  ///
  /// This method finds the `Todo` with the specified `id` and creates a copy
  /// with its `completed` field toggled. The state is updated with a new list
  /// of todos where only the target `Todo` is modified.
  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  /// Removes a `Todo` from the list by its `id`.
  ///
  /// This method filters out the `Todo` with the specified `id` from the list
  /// and updates the state with a new list that excludes the removed task.
  void removeTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo,
    ];
  }
}

/// A `StateNotifierProvider` that exposes the `TodosNotifier` to the rest of the app.
///
/// This provider allows other parts of the application to watch and interact
/// with the list of todos, leveraging the `StateNotifier`'s methods to manage
/// state in an immutable way. It can also be extended with `autoDispose`
/// and `family` modifiers for advanced use cases.
final todosOnStateNotifierProvider =
    StateNotifierProvider<TodosOnStateNotifier, List<Todo>>((ref) {
      return TodosOnStateNotifier();
    });
