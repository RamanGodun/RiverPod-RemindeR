import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/todo_model_mutable.dart';

/// `TodosNotifier` is a `ChangeNotifier` that manages a list of mutable `Todo` objects.
///
/// This class provides methods for adding, toggling, and removing `Todo` items.
/// It uses the `ChangeNotifier` mechanism to notify listeners when the state changes.
class TodosNotifier extends ChangeNotifier {
  /// Internal list of _todos that the app will manage.
  final List<Todo> _todos = [];

  /// Public getter to access the list of todos.
  List<Todo> get todos => _todos;

  /// Adds a new `Todo` to the list and notifies listeners about the change.
  ///
  /// This method creates a new `Todo` using the `Todo.add` factory constructor,
  /// which generates a unique `id`. Once the new `Todo` is added to the list,
  /// `notifyListeners` is called to trigger UI updates in any listening widgets.
  void addTodo(String description) {
    _todos.add(Todo.add(description: description));
    notifyListeners();
  }

  /// Toggles the `completed` status of a `Todo` by its `id` and notifies listeners.
  ///
  /// This method finds the `Todo` with the specified `id` and toggles its `completed`
  /// status. After modifying the `Todo`, `notifyListeners` is called to update the UI.
  void toggleTodo(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }

  /// Removes a `Todo` from the list by its `id` and notifies listeners.
  ///
  /// This method filters out the `Todo` with the specified `id` and updates the list.
  /// After removal, `notifyListeners` is called to refresh the UI.
  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

/// `todosProvider` is a `ChangeNotifierProvider` that exposes the `TodosNotifier` to the rest of the app.
///
/// This provider allows any part of the application to access the `TodosNotifier`
/// and listen for changes in the list of _todos. The provider can be further enhanced with
/// modifiers such as `autoDispose` or `family` depending on the use case.
final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});
