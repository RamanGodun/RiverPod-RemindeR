import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/todo_model_mutable.dart';

/// 📝 [TodosOnChangeNotifier] is a `ChangeNotifier` that manages a list of mutable [MutableTodoModel] objects.
/// Each state update mutates the existing list and notifies listeners.
class TodosOnChangeNotifier extends ChangeNotifier {
  final List<MutableTodoModel> _todos = [];

  /// Public getter to access current todo list.
  List<MutableTodoModel> get todos => _todos;

  /// Adds a new [MutableTodoModel] using [Todo.add] and notifies listeners.
  void addTodo(String description) {
    _todos.add(MutableTodoModel.add(description: description));
    notifyListeners();
  }

  /// Toggles [MutableTodoModel.completed] status by `id` and notifies listeners.
  void toggleTodo(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }

  /// Removes a [MutableTodoModel] by filtering out its `id` and notifies listeners.
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
