import '../../../../core/domain/models/activity_model/activity.dart';

/// Sealed state for async activity operations.
sealed class SealedAsyncActivityState {
  const SealedAsyncActivityState();

  /// Exhaustive pattern matching for all state variants.
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(List<Activity> activities) success,
    required T Function(String error) failure,
  }) {
    switch (this) {
      case SealedAsyncActivityInitial():
        return initial();
      case SealedAsyncActivityLoading():
        return loading();
      case SealedAsyncActivitySuccess(:final activities):
        return success(activities);
      case SealedAsyncActivityFailure(:final error):
        return failure(error);
    }
  }
}

/// Initial state (no action triggered yet).
final class SealedAsyncActivityInitial extends SealedAsyncActivityState {
  const SealedAsyncActivityInitial();

  @override
  String toString() => 'SealedAsyncActivityInitial()';
}

/// Loading state while fetching data.
final class SealedAsyncActivityLoading extends SealedAsyncActivityState {
  const SealedAsyncActivityLoading();

  @override
  String toString() => 'SealedAsyncActivityLoading()';
}

/// Success state with fetched activities.
final class SealedAsyncActivitySuccess extends SealedAsyncActivityState {
  final List<Activity> activities;

  const SealedAsyncActivitySuccess({required this.activities});

  @override
  String toString() => 'SealedAsyncActivitySuccess(activities: $activities)';
}

/// Failure state with error message.
final class SealedAsyncActivityFailure extends SealedAsyncActivityState {
  final String error;

  const SealedAsyncActivityFailure({required this.error});

  @override
  String toString() => 'SealedAsyncActivityFailure(error: $error)';
}
