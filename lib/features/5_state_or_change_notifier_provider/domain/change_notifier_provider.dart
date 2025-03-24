import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/todo_model_mutable.dart';

/// 📝 [TodosOnChangeNotifier] is a `ChangeNotifier` that manages a list of mutable [Todo] objects.
/// Each state update mutates the existing list and notifies listeners.
class TodosOnChangeNotifier extends ChangeNotifier {
  final List<Todo> _todos = [];

  /// Public getter to access current todo list.
  List<Todo> get todos => _todos;

  /// Adds a new [Todo] using [Todo.add] and notifies listeners.
  void addTodo(String description) {
    _todos.add(Todo.add(description: description));
    notifyListeners();
  }

  /// Toggles [Todo.completed] status by `id` and notifies listeners.
  void toggleTodo(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }

  /// Removes a [Todo] by filtering out its `id` and notifies listeners.
  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

/// 📦 Provides access to [TodosOnChangeNotifier] and its mutable todo list.
/// Easily extendable with `.autoDispose`, `.family`, etc.
final todosOnChangeNotifierProvider =
    ChangeNotifierProvider<TodosOnChangeNotifier>(
      (ref) => TodosOnChangeNotifier(),
    );
