import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/models/activity_model/activity.dart';
import '../../../../core/domain/models/enums.dart';

part 'enum_based_async_activity_state.freezed.dart';

@freezed
class EnumAsyncActivityState with _$EnumAsyncActivityState {
  // This factory defines the structure of the async activity state.
  // It holds the current status of the activity, a list of activities, and a potential error message.
  const factory EnumAsyncActivityState({
    required ActivityStatus
    status, // Tracks the current status of the data fetching.
    required List<Activity> activities, // List of fetched activities.
    required String error, // Stores the error message in case of failure.
  }) = _EnumAsyncActivityState;

  // A convenient factory constructor to create the initial state.
  // It sets the status to 'initial', provides an empty list of activities,
  // and ensures no error is present at the start.
  factory EnumAsyncActivityState.initial() {
    return EnumAsyncActivityState(
      status: ActivityStatus.initial,
      activities: [Activity.empty()],
      error: '', // No error initially.
    );
  }
}
