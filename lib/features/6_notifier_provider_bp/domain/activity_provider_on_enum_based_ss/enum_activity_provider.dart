import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_reminder/core/domain/state/dio_and_retrofit/dio_providers/activities_api/activities_dio_provider.dart';
import '../../../../core/domain/models/activity_model/activity.dart';
import '../../../../core/domain/models/enums.dart';
import '../../../../core/domain/state/errors_handling/for_errors_simulation_counter_provider.dart';
import 'enum_activity_state.dart';

part 'enum_activity_provider.g.dart';

@riverpod
class EnumActivity extends _$EnumActivity {
  @override
  EnumActivityState build() {
    ref.onDispose(() {
      print('[enumActivityProvider] disposed');
    });
    //  and for Debugging purposes, to track state changes, to check is instance is destroyed?
    debugPrint('initial hashCode: $hashCode');
    return EnumActivityState.initial();
  }

  // Fetches activities based on the given activity type from the API.
  // It simulates a network call where every second call fails to test error handling.
  Future<void> fetchActivity(String activityType) async {
    // to sure that an instance doesn't destroyed (hash codes are the same, so after refreshing no extra objects)
    //! (notifier builds method executed again, but Notifier instance itself doesn't re-create?) the same as after state's changing of provider,
    // !from which this Notifier depends (in this case  ref.watch(myCounterProvider);)
    // ! that's why this type of Provider is better then StateProvider or ChangeNotifierProvider (!!)
    debugPrint('hashCode in fetchActivity: $hashCode');
    state = state.copyWith(status: ActivityStatus.loading);

    try {
      ref.read(forErrorsSimulationCounterProvider.notifier).increment();
      final counter = ref.read(forErrorsSimulationCounterProvider);
      debugPrint('_errorCounter: $counter');

      // Simulate an error for 50% of requests by checking the counter.
      if (counter % 2 != 1) {
        await Future.delayed(
          const Duration(milliseconds: 500), // Simulate network delay
        );
        throw 'This is simulation of failure of fetch activity';
      }

      // Perform the API request to fetch activities by type.
      final response = await ref
          .read(activitiesDioProvider)
          .get('?type=$activityType');
      // For debugging response status.
      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Response type: ${response.data.runtimeType}');
      // For debugging response body
      debugPrint('Response body: ${response.data}');

      final activities = <Activity>[];

      // Check if API returns List or single object
      if (response.data is List) {
        // Convert the response into a list of Activity objects.
        for (final activity in response.data) {
          activities.add(Activity.fromJson(activity));
        }
      } else if (response.data is Map<String, dynamic>) {
        // Handle case when API returns single object
        activities.add(Activity.fromJson(response.data));
      } else {
        // Unexpected format
        throw 'Unexpected API response format: ${response.data.runtimeType}';
      }

      // Update the state to success and populate it with fetched activities.
      state = state.copyWith(
        status: ActivityStatus.success,
        activities: activities,
      );
    } catch (e) {
      // If any error occurs, update the state to failure and pass the error message.
      state = state.copyWith(
        status: ActivityStatus.failure,
        error: e.toString(),
      );
    }
  }
}
