import '../../../../core/domain/models/activity.dart';

sealed class SealedAsyncActivityState {
  const SealedAsyncActivityState();

  // The `when` method provides a structured way to handle all possible states of SealedActivityState.
  // It ensures that each state is processed by the caller, based on the provided callbacks.
  // This pattern is similar to what we see in functional programming, allowing for clear state management.
  // `switch-case` is used here to guarantee that all subclasses are handled.
  T when<T>({
    required T Function() loading,
    required T Function(List<Activity> activities) success,
    required T Function(String error) failure,
  }) {
    switch (this) {
      case SealedAsyncActivityLoading():
        return loading();
      // Handles the SealedActivitySuccess state, providing the activities list to the `success` callback.
      case SealedAsyncActivitySuccess(activities: List<Activity> activities):
        return success(activities);
      // Handles the SealedActivityFailure state, passing the error message to the `failure` callback.
      case SealedAsyncActivityFailure(error: String error):
        return failure(error);
    }
  }
}

final class SealedAsyncActivityLoading extends SealedAsyncActivityState {
  const SealedAsyncActivityLoading();

  @override
  String toString() => 'SealedAsyncActivityLoading()';
}

final class SealedAsyncActivitySuccess extends SealedAsyncActivityState {
  final List<Activity> activities;
  const SealedAsyncActivitySuccess({required this.activities});

  @override
  String toString() => 'SealedAsyncActivitySuccess(activities: $activities)';
}

final class SealedAsyncActivityFailure extends SealedAsyncActivityState {
  final String error;
  const SealedAsyncActivityFailure({required this.error});

  @override
  String toString() => 'SealedAsyncActivityFailure(error: $error)';
}
