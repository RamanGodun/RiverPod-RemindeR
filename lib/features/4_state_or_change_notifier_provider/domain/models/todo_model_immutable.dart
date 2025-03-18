import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/utils_and_services/id_generator.dart';

part 'todo_model_immutable.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String description,
    @Default(false) bool completed,
  }) = _Todo;

  factory Todo.add({required String description}) {
    return Todo(id: uuid.v4(), description: description);
  }
}
