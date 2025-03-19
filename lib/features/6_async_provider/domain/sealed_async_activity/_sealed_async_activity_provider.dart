import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/domain/models/activity.dart';
import '../../../../core/domain/state/dio_and_retrofit/activities_api/activities_dio_provider.dart';
import '_sealed_async_activity_state.dart';

part '_sealed_async_activity_provider.g.dart';

@riverpod
class SealedAsyncActivity extends _$SealedAsyncActivity {
  int _errorCounter = 0;

  SealedAsyncActivity() {
    print('[SealedAsyncActivity] constructor called');
  }

  @override
  SealedAsyncActivityState build() {
    print('[sealedAsyncActivityProvider] initialized');
    ref.onDispose(() {
      print('[sealedAsyncActivityProvider] disposed');
    });
    print('hashCode: $hashCode');
    fetchActivity(activityTypes[0]);
    //instead EnumAsyncActivityState.initial() (as was in enum based)
    // ! that's why we need initial state in enum-based state: we use method "copyWith()",
    // ! which cannot be called on not initialized object
    return const SealedAsyncActivityLoading();
  }

  Future<void> fetchActivity(String activityType) async {
    print('hashCode in fetchActivity: $hashCode');
    state = const SealedAsyncActivityLoading();

    try {
      print('_errorCounter: $_errorCounter');
      if (_errorCounter++ % 2 != 1) {
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
