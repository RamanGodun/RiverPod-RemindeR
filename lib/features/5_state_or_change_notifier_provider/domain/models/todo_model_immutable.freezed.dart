// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model_immutable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImmutableTodoModel {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  /// Create a copy of ImmutableTodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImmutableTodoModelCopyWith<ImmutableTodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImmutableTodoModelCopyWith<$Res> {
  factory $ImmutableTodoModelCopyWith(
          ImmutableTodoModel value, $Res Function(ImmutableTodoModel) then) =
      _$ImmutableTodoModelCopyWithImpl<$Res, ImmutableTodoModel>;
  @useResult
  $Res call({String id, String description, bool completed});
}

/// @nodoc
class _$ImmutableTodoModelCopyWithImpl<$Res, $Val extends ImmutableTodoModel>
    implements $ImmutableTodoModelCopyWith<$Res> {
  _$ImmutableTodoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImmutableTodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImmutableTodoModelImplCopyWith<$Res>
    implements $ImmutableTodoModelCopyWith<$Res> {
  factory _$$ImmutableTodoModelImplCopyWith(_$ImmutableTodoModelImpl value,
          $Res Function(_$ImmutableTodoModelImpl) then) =
      __$$ImmutableTodoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String description, bool completed});
}

/// @nodoc
class __$$ImmutableTodoModelImplCopyWithImpl<$Res>
    extends _$ImmutableTodoModelCopyWithImpl<$Res, _$ImmutableTodoModelImpl>
    implements _$$ImmutableTodoModelImplCopyWith<$Res> {
  __$$ImmutableTodoModelImplCopyWithImpl(_$ImmutableTodoModelImpl _value,
      $Res Function(_$ImmutableTodoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImmutableTodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? completed = null,
  }) {
    return _then(_$ImmutableTodoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ImmutableTodoModelImpl
    with DiagnosticableTreeMixin
    implements _ImmutableTodoModel {
  const _$ImmutableTodoModelImpl(
      {required this.id, required this.description, this.completed = false});

  @override
  final String id;
  @override
  final String description;
  @override
  @JsonKey()
  final bool completed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImmutableTodoModel(id: $id, description: $description, completed: $completed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImmutableTodoModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('completed', completed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmutableTodoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, description, completed);

  /// Create a copy of ImmutableTodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImmutableTodoModelImplCopyWith<_$ImmutableTodoModelImpl> get copyWith =>
      __$$ImmutableTodoModelImplCopyWithImpl<_$ImmutableTodoModelImpl>(
          this, _$identity);
}

abstract class _ImmutableTodoModel implements ImmutableTodoModel {
  const factory _ImmutableTodoModel(
      {required final String id,
      required final String description,
      final bool completed}) = _$ImmutableTodoModelImpl;

  @override
  String get id;
  @override
  String get description;
  @override
  bool get completed;

  /// Create a copy of ImmutableTodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImmutableTodoModelImplCopyWith<_$ImmutableTodoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
