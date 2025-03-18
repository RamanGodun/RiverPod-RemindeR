import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/todo_model_mutable.dart';

/// `TodosOnChangeNotifier` is a `ChangeNotifier` that manages a list of mutable `Todo` objects.
///
/// Provides methods for adding, toggling, and removing `Todo` items.
/// Utilizes the `ChangeNotifier` mechanism to notify listeners when the state changes.
class TodosOnChangeNotifier extends ChangeNotifier {
  final List<Todo> _todos = [];
  // Public getter to access the list of todos.
  List<Todo> get todos => _todos;

  /// Adds a new `Todo` to the list and notifies listeners about the change.
  void addTodo(String description) {
    _todos.add(Todo.add(description: description));
    notifyListeners(); // Notifies UI listeners to rebuild.
  }

  /// Toggles the `completed` status of a `Todo` by its `id` and notifies listeners.
  void toggleTodo(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }

  /// Removes a `Todo` from the list by its `id` and notifies listeners.
  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

/// `todosOnChangeNotifierProvider` exposes the `TodosOnChangeNotifier` to the rest of the app.
///
/// Any widget can read or listen to this provider to interact with the list of todos.
/// This provider can be extended with modifiers like `autoDispose` or `family` if needed.
final todosOnChangeNotifierProvider =
    ChangeNotifierProvider<TodosOnChangeNotifier>((ref) {
      return TodosOnChangeNotifier();
    });
