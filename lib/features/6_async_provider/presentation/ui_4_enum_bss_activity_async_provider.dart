import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/models/activity.dart';
import '../../../core/domain/models/enum_based_async_activity_state.dart';
import '../../../core/domain/models/enums.dart';
import '../../../core/ui/widgets/activity_widget.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/enum_based_async_state/enum_async_activity_provider.dart';

class Page4EnumBasedAsyncActivityProvider extends ConsumerWidget {
  const Page4EnumBasedAsyncActivityProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// If the status transitions to 'failure' in EnumActivityState provider, an error dialog is displayed.
    listenForFailures(context, ref);

    ///
    final asyncActivityState = ref.watch(enumAsyncActivityProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Enum BSS Async Provider',
        actionIcons: const [Icons.add, Icons.refresh],
        actionCallbacks: [
          () => ref.read(myCounterProvider.notifier).increment(),
          () => ref.invalidate(enumAsyncActivityProvider),
        ],
      ),

      body: switch (asyncActivityState.status) {
        ///
        ActivityStatus.initial => const Center(
          child: TextWidget('Get some activity', TextType.titleMedium),
        ),

        ///
        ActivityStatus.loading => const AppMiniWidgets(MWType.loading),

        ///
        // Failure state, displaying an error widget or a fallback activity, when no available previous data => error widget
        // ! when failure happens, then available previous data are shown (good pattern)
        ActivityStatus.failure =>
          asyncActivityState.activities.first == Activity.empty()
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppMiniWidgets(
                  MWType.error,
                  error: asyncActivityState.error,
                ),
              )
              : ActivityWidget(activity: asyncActivityState.activities.first),

        ///
        ActivityStatus.success => ActivityWidget(
          activity: asyncActivityState.activities.first,
        ),
      },

      ///
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Randomly selects an activity type and fetches a new activity.
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(enumAsyncActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: const TextWidget('New Activity', TextType.titleMedium),
      ),
    );
  }

  /* 
     * Method to listen for any failures in the EnumActivityState provider and display an error dialog.
 */
  void listenForFailures(BuildContext context, WidgetRef ref) {
    ref.listen<EnumAsyncActivityState>(enumAsyncActivityProvider, (
      previous,
      next,
    ) {
      if (next.status == ActivityStatus.failure && context.mounted) {
        DialogService.showAlertErrorDialog(context, next.error);
      }
    });
  }

  //
}
