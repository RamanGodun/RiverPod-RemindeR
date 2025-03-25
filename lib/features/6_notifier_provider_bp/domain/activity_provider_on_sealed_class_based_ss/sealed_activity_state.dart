import '../../../../core/domain/models/activity_model/activity.dart';

/// Represents all possible states for activity fetching.
sealed class SealedActivityState {
  const SealedActivityState();

  /// Exhaustive pattern matching for each state.
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(List<Activity> activities) success,
    required T Function(String error) failure,
  }) {
    switch (this) {
      case SealedActivityInitial():
        return initial();
      case SealedActivityLoading():
        return loading();
      case SealedActivitySuccess(activities: List<Activity> activities):
        return success(activities);
      case SealedActivityFailure(error: String error):
        return failure(error);
    }
  }
}

/// Initial state before any activity is fetched.
final class SealedActivityInitial extends SealedActivityState {
  const SealedActivityInitial();
  @override
  String toString() => 'SealedActivityInitial()';
}

/// State while loading activity data.
final class SealedActivityLoading extends SealedActivityState {
  const SealedActivityLoading();
  @override
  String toString() => 'SealedActivityLoading()';
}

/// State after successful activity fetch.
final class SealedActivitySuccess extends SealedActivityState {
  final List<Activity> activities;
  const SealedActivitySuccess({required this.activities});
  @override
  String toString() => 'SealedActivitySuccess(activity: $activities)';
}

/// State when fetching activity fails.
final class SealedActivityFailure extends SealedActivityState {
  final String error;
  const SealedActivityFailure({required this.error});
  @override
  String toString() => 'SealedActivityFailure(error: $error)';
}
