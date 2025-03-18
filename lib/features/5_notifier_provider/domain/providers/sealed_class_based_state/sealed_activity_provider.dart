import 'package:flutter/foundation.dart';

import '../../models/activity.dart';
import '../dio_provider.dart';
import 'sealed_activity_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sealed_activity_provider.g.dart';

// Riverpod provider that manages the activity fetching logic and state transitions
@riverpod
class SealedActivity extends _$SealedActivity {
  // Counter to simulate errors every second request. Used for testing failure handling.
  int _errorCounter = 0;

  // The initial state of the provider when it is first created.
  // This method is executed when the provider is initialized or refreshed.
  @override
  SealedActivityState build() {
    // Setting up a disposal callback. When the provider is no longer needed, it is disposed of.
    ref.onDispose(() {
      print('[sealedActivityProvider] disposed');
    });
    print(
      'hashCode: $hashCode',
    ); // Used to track the provider's instance lifecycle.
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
      print('_errorCounter: $_errorCounter');

      // Simulating a failure every second request.
      // Delays the request for 500ms and throws an error for every odd `_errorCounter`.
      if (_errorCounter++ % 2 != 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        throw 'Fail to fetch activity';
      }

      // Fetching data from the API using the dioProvider.
      final response = await ref.read(dioProvider).get('?type=$activityType');
      debugPrint(response.data);
      final List activityList = response.data;

      // Parsing the response data into a list of `Activity` objects.
      final activities = [
        for (final activity in activityList) Activity.fromJson(activity),
      ];

      // Transitioning to the success state with the fetched activities.
      state = SealedActivitySuccess(activities: activities);
    } catch (e) {
      // Transitioning to the failure state with the error message in case of an exception.
      state = SealedActivityFailure(error: e.toString());
    }
  }
}
