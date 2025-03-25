import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/models/activity_model/activity.dart';
import '../../../../core/domain/models/enums.dart';

part 'enum_activity_state.freezed.dart';

@freezed
class EnumActivityState with _$EnumActivityState {
  /// Represents the state of activity fetching using enum-based status.
  const factory EnumActivityState({
    required ActivityStatus status, // Current fetching status
    required List<Activity> activities, // Fetched activities
    required String error, // Error message (if any)
  }) = _EnumActivityState;

  /// Returns the initial/default state.
  factory EnumActivityState.initial() {
    return EnumActivityState(
      status: ActivityStatus.initial,
      activities: [Activity.empty()],
      error: '',
    );
  }
}
