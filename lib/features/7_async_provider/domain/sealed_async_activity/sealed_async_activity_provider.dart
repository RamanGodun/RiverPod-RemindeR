import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/domain/models/activity_model/activity.dart';
import '../../../../core/domain/providers/dio_and_retrofit/dio_providers/activities_api/activities_dio_provider.dart';
import '../../../../core/domain/providers/errors_handling/for_errors_simulation_counter_provider.dart';
import 'sealed_async_activity_state.dart';

part 'sealed_async_activity_provider.g.dart';

@riverpod
class SealedAsyncActivity extends _$SealedAsyncActivity {
  SealedAsyncActivity() {
    debugPrint('[SealedAsyncActivity] constructor called');
  }

  @override
  SealedAsyncActivityState build() {
    debugPrint('[sealedAsyncActivityProvider] initialized');
    ref.onDispose(() {
      debugPrint('[sealedAsyncActivityProvider] disposed');
    });

    debugPrint('hashCode: $hashCode');
    // fetchActivity(activityTypes[0]);
    //instead EnumAsyncActivityState.initial() (as was in enum based)
    // ! that's why we need initial state in enum-based state: we use method "copyWith()", which cannot be called on not initialized object
    return const SealedAsyncActivityInitial();
  }

  Future<void> fetchActivity(String activityType) async {
    debugPrint('hashCode in fetchActivity: $hashCode');
    state = const SealedAsyncActivityLoading();

    try {
      ref.read(forErrorsSimulationCounterProvider.notifier).increment();
      final counter = ref.read(forErrorsSimulationCounterProvider);
      debugPrint('_errorCounter: $counter');

      /// Simulate an error for 50% of requests (by checking the counter) and network delay (500 ms)
      if (counter % 2 != 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        throw 'Fail to fetch activity';
      }

      final response = await ref
          .read(activitiesDioProvider)
          .get('?type=$activityType');

      final List activityList = response.data;

      final activities = [
        for (final activity in activityList) Activity.fromJson(activity),
      ];

      state = SealedAsyncActivitySuccess(activities: activities);
    } catch (e) {
      state = SealedAsyncActivityFailure(error: e.toString());
    }
  }
}
