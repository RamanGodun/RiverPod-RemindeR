import 'package:uuid/uuid.dart';

/// Singleton instance of `Uuid` used to generate unique IDs for each `Todo`.
Uuid uuid = const Uuid();

/// A model class representing a single `Todo` item.
///
/// This class encapsulates the essential properties of a task:
/// - `id`: A unique identifier for the task, generated using `uuid`.
/// - `description`: A brief description of the task.
/// - `completed`: A boolean flag indicating whether the task is completed (default is `false`).
class Todo {
  String id;
  String description;
  bool completed;

  /// Main constructor for the `Todo` class.
  ///
  /// The `id` and `description` fields are required, while the `completed` field
  /// defaults to `false` if not provided.
  Todo({
    required this.id,
    required this.description,
    this.completed = false,
  });

  /// Factory constructor to create a new `Todo` instance with a unique `id`.
  ///
  /// This constructor simplifies the creation of a new `Todo` by automatically
  /// generating a unique identifier for the task using `uuid.v4()`.
  /// It ensures that every task created has a unique `id`.
  factory Todo.add({required String description}) {
    return Todo(id: uuid.v4(), description: description);
  }

  /// A convenience method to provide a string representation of the `Todo` object.
  ///
  /// This method is useful for logging or debugging purposes, as it returns
  /// a human-readable string with the `id`, `description`, and `completed` status.
  @override
  String toString() =>
      'Todo(id: $id, description: $description, completed: $completed)';
}
