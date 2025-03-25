import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/models/activity_model/activity.dart';
import '../../../../core/domain/models/enums.dart';

part 'enum_based_async_activity_state.freezed.dart';

/// Represents async state for activity fetching using [ActivityStatus] enum.
@freezed
class EnumAsyncActivityState with _$EnumAsyncActivityState {
  /// Main state constructor holding status, list of activities, and optional error.
  const factory EnumAsyncActivityState({
    required ActivityStatus status,
    required List<Activity> activities,
    required String error,
  }) = _EnumAsyncActivityState;

  /// Initial state with default values.
  factory EnumAsyncActivityState.initial() {
    return EnumAsyncActivityState(
      status: ActivityStatus.initial,
      activities: [Activity.empty()],
      error: '',
    );
  }
}
