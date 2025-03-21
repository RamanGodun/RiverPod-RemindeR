import 'package:flutter/foundation.dart';
import '../../../../core/domain/models/activity_model/activity.dart';
import '../../../../core/domain/state/dio_and_retrofit/dio_providers/activities_api/activities_dio_provider.dart';
import '../../../../core/domain/state/errors_handling/for_errors_simulation_counter_provider.dart';
import 'sealed_activity_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sealed_activity_provider.g.dart';

// Riverpod provider that manages the activity fetching logic and state transitions
@Riverpod(keepAlive: true)
class SealedActivity extends _$SealedActivity {
  // Counter to simulate errors every second request. Used for testing failure handling.
  // *** видалили локальний _errorCounter

  // The initial state of the provider when it is first created.
  // This method is executed when the provider is initialized or refreshed.
  @override
  SealedActivityState build() {
    // Setting up a disposal callback. When the provider is no longer needed, it is disposed of.
    ref.onDispose(() {
      print('[sealedActivityProvider] disposed');
    });
    print('hashCode: $hashCode');
    return const SealedActivityInitial(); // Initial state is "SealedActivityInitial".
  }

  // Fetches the activity data from the API, transitioning the state between loading, success, or failure.
  Future<void> fetchActivity(String activityType) async {
    // Ensuring the instance remains the same after a refresh. The hash code remains consistent across rebuilds,
    // indicating that the Notifier instance is not recreated but only its internal state changes.
    // This is a key advantage of NotifierProvider over ChangeNotifierProvider or StateProvider.
    print('hashCode in fetchActivity: $hashCode');

    // Transition to the loading state while the API call is in progress.
    state = const SealedActivityLoading();

    try {
      ref.read(forErrorsSimulationCounterProvider.notifier).increment();
      final counter = ref.read(forErrorsSimulationCounterProvider);
      print('_errorCounter: $counter');

      // Simulating a failure every second request.
      // Delays the request for 500ms and throws an error for every odd counter.
      if (counter % 2 != 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        throw 'This is simulation of failure of fetch activity';
      }

      // Fetching data from the API using the dioProvider.
      final response = await ref
          .read(activitiesDioProvider)
          .get('?type=$activityType');

      debugPrint('Response type: ${response.data.runtimeType}');
      debugPrint('Response body: ${response.data}');

      final activities = <Activity>[];

      // Check if API returns List or single object
      if (response.data is List) {
        // If the response is a list, parse each item
        for (final activity in response.data) {
          activities.add(Activity.fromJson(activity));
        }
      } else if (response.data is Map<String, dynamic>) {
        // If response is single object (e.g., Map), parse as single Activity
        activities.add(Activity.fromJson(response.data));
      } else {
        // Unexpected response format
        throw 'Unexpected API response format: ${response.data.runtimeType}';
      }

      // Transitioning to the success state with the fetched activities.
      state = SealedActivitySuccess(activities: activities);
    } catch (e, stackTrace) {
      // For debugging purposes, print full stack trace
      debugPrint('FetchActivity error: $e');
      debugPrintStack(stackTrace: stackTrace);

      // Transitioning to the failure state with the error message in case of an exception.
      state = SealedActivityFailure(error: e.toString());
    }
  }
}
