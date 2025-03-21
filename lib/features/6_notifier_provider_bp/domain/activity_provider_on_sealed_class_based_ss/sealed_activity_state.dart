import '../../../../core/domain/models/activity_model/activity.dart';

sealed class SealedActivityState {
  const SealedActivityState();

  // The `when` method provides a structured way to handle all possible states of SealedActivityState.
  // It ensures that each state is processed by the caller, based on the provided callbacks.
  // This pattern is similar to what we see in functional programming, allowing for clear state management.
  // `switch-case` is used here to guarantee that all subclasses are handled.
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(List<Activity> activities) success,
    required T Function(String error) failure,
  }) {
    switch (this) {
      // Handles the SealedActivityInitial state, invoking the `initial` callback.
      case SealedActivityInitial():
        return initial();
      // Handles the SealedActivityLoading state, invoking the `loading` callback.
      case SealedActivityLoading():
        return loading();
      // Handles the SealedActivitySuccess state, providing the activities list to the `success` callback.
      case SealedActivitySuccess(activities: List<Activity> activities):
        return success(activities);
      // Handles the SealedActivityFailure state, passing the error message to the `failure` callback.
      case SealedActivityFailure(error: String error):
        return failure(error);
      // The fallback `case _:` has been commented out, as Dart guarantees that all cases are covered with sealed classes.
      // Uncomment if you want additional safety for potential future extensions.
      // case _:
      //   throw Exception('Unknown state: $this');
    }
  }
}

// `SealedActivityInitial` represents the initial state where no data has been fetched yet.
// This state is final to prevent external modification or extension.
final class SealedActivityInitial extends SealedActivityState {
  const SealedActivityInitial();

  // A custom `toString` method to easily identify this state in debugging and logging.
  @override
  String toString() => 'SealedActivityInitial()';
}

// `SealedActivityLoading` represents the state where the activity is being fetched.
// It's useful for showing loading indicators while the fetch is in progress.
final class SealedActivityLoading extends SealedActivityState {
  const SealedActivityLoading();

  // A custom `toString` method for easier debugging of the loading state.
  @override
  String toString() => 'SealedActivityLoading()';
}

// `SealedActivitySuccess` represents the successful state where activities have been fetched.
// It contains a list of `Activity` objects, which the UI can display.
final class SealedActivitySuccess extends SealedActivityState {
  final List<Activity>
  activities; // The activities retrieved during a successful fetch.

  const SealedActivitySuccess({
    required this.activities, // Activities are required for a successful state.
  });

  // A custom `toString` method that includes the activities for detailed logging and debugging.
  @override
  String toString() => 'SealedActivitySuccess(activity: $activities)';
}

// `SealedActivityFailure` represents the failure state, typically caused by an error during the fetch.
// It contains an error message explaining why the fetch failed.
final class SealedActivityFailure extends SealedActivityState {
  final String
  error; // A descriptive error message for logging or display in the UI.

  const SealedActivityFailure({
    required this.error, // Error is required to describe the failure.
  });

  // A custom `toString` method that includes the error message for debugging.
  @override
  String toString() => 'SealedActivityFailure(error: $error)';
}
