import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_reminder/core/domain/state/dio_and_retrofit/activities_api/activities_dio_provider.dart';
import '../../../../core/domain/models/activity.dart';
import '../../../../core/domain/models/enum_based_async_activity_state.dart';
import '../../../../core/domain/models/enums.dart';

part 'enum_async_activity_provider.g.dart';

@riverpod
class EnumAsyncActivity extends _$EnumAsyncActivity {
  int _counterForErrorsGenerating = 0;

  EnumAsyncActivity() {
    print('[EnumAsyncActivity] was called');
  }

  @override
  EnumAsyncActivityState build() {
    print('[EnumAsyncActivity] was initialized');
    ref.onDispose(() => print('[enumAsyncActivityProvider] disposed'));
    ref.watch(myCounterProvider);
    state = EnumAsyncActivityState.initial();
    print('initial hashCode: $hashCode');
    fetchActivity(activityTypes[0]);
    return EnumAsyncActivityState.initial();
  }

  Future<void> fetchActivity(String activityType) async {
    print('hashCode in fetchActivity: $hashCode');
    state = state.copyWith(status: ActivityStatus.loading);

    try {
      print('_errorCounter: $_counterForErrorsGenerating');
      // Simulate an error for 50% of requests by checking the counter.
      if (_counterForErrorsGenerating++ % 2 != 1) {
        await Future.delayed(
          const Duration(milliseconds: 500),
        ); // Simulate network delay.
        throw 'Fail to fetch activity'; // Throwing an error to simulate failure.
      }

      // Perform the API request to fetch activities by type.
      final response = await ref
          .read(activitiesDioProvider)
          .get('?type=$activityType');
      print(
        'Status code: ${response.statusCode}',
      ); // For debugging response status.
      print('Response body: ${response.data}'); // For debugging response body.

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

/*
MyCounter provider handles a simple integer state.
It increments a counter which is observed by EnumAsyncActivity to trigger side effects.
 */
@riverpod
class MyCounter extends _$MyCounter {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;
}
