import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_reminder/core/domain/state/dio_and_retrofit/activities_api/activities_dio_provider.dart';
import '../../../../core/domain/models/activity.dart';
import '../../../../core/domain/models/enums.dart';
import '../../../../core/domain/state/errors_handling/for_errors_simulation_counter_provider.dart';
import 'enum_based_async_activity_state.dart';

part 'enum_async_activity_provider.g.dart';

@riverpod
class EnumAsyncActivity extends _$EnumAsyncActivity {
  EnumAsyncActivity() {
    debugPrint('[EnumAsyncActivity] was called');
  }

  @override
  EnumAsyncActivityState build() {
    debugPrint('[EnumAsyncActivity] was initialized');
    ref.onDispose(() => print('[EnumAsyncActivity] disposed'));
    state = EnumAsyncActivityState.initial();
    debugPrint('initial hashCode: $hashCode');
    fetchActivity(activityTypes[0]);
    return EnumAsyncActivityState.initial();
  }

  Future<void> fetchActivity(String activityType) async {
    debugPrint('hashCode in fetchActivity: $hashCode');
    state = state.copyWith(status: ActivityStatus.loading);

    try {
      ref.read(forErrorsSimulationCounterProvider.notifier).increment();
      final counter = ref.read(forErrorsSimulationCounterProvider);
      debugPrint('_errorCounter: $counter');

      // Simulate an error for 50% of requests (by checking the counter) and network delay (500 ms)
      if (counter % 2 != 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        throw 'This is simulation of failure of fetch activity';
      }

      // Perform the API request to fetch activities by type.
      final response = await ref
          .read(activitiesDioProvider)
          .get('?type=$activityType');
      // For debugging response status
      debugPrint('Status code: ${response.statusCode}');
      // For debugging response body
      debugPrint('Response body: ${response.data}');

      // Convert the response into a list of Activity objects.
      final List activityList = response.data;
      final activities = [
        for (final activity in activityList) Activity.fromJson(activity),
      ];

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
