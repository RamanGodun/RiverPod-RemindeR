import 'package:flutter/foundation.dart';
import '../../../../core/domain/models/activity_model/activity.dart';
import '../../../../core/domain/providers/dio_and_retrofit/dio_providers/activities_api/activities_dio_provider.dart';
import '../../../../core/domain/providers/errors_handling/for_errors_simulation_counter_provider.dart';
import 'sealed_activity_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sealed_activity_provider.g.dart';

@Riverpod(keepAlive: true)
class SealedActivity extends _$SealedActivity {
  /// Initializes the provider with an initial state.
  @override
  SealedActivityState build() {
    ref.onDispose(() {
      debugPrint('[sealedActivityProvider] disposed');
    });
    debugPrint('hashCode: $hashCode');
    return const SealedActivityInitial();
  }

  /// Fetches activities from the API and updates the state accordingly.
  Future<void> fetchActivity(String activityType) async {
    debugPrint('hashCode in fetchActivity: $hashCode');

    state = const SealedActivityLoading();

    try {
      // Simulates an error (with probability 50%)
      ref.read(forErrorsSimulationCounterProvider.notifier).increment();
      final counter = ref.read(forErrorsSimulationCounterProvider);
      debugPrint('_errorCounter: $counter');

      if (counter % 2 != 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        throw 'This is simulation of failure of fetch activity';
      }

      final response = await ref
          .read(activitiesDioProvider)
          .get('?type=$activityType');

      debugPrint('Response type: ${response.data.runtimeType}');
      debugPrint('Response body: ${response.data}');

      final activities = <Activity>[];

      if (response.data is List) {
        for (final activity in response.data) {
          activities.add(Activity.fromJson(activity));
        }
      } else if (response.data is Map<String, dynamic>) {
        activities.add(Activity.fromJson(response.data));
      } else {
        throw 'Unexpected API response format: ${response.data.runtimeType}';
      }

      state = SealedActivitySuccess(activities: activities);
    } catch (e, stackTrace) {
      debugPrint('FetchActivity error: $e');
      debugPrintStack(stackTrace: stackTrace);
      state = SealedActivityFailure(error: e.toString());
    }
  }
}
