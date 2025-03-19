import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/models/activity.dart';
import '../../../core/domain/state/errors_handling/for_errors_simulation_counter_provider.dart';
import '../../../core/ui/widgets/activity_widget.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/sealed_async_activity/sealed_async_activity_provider.dart';
import '../domain/sealed_async_activity/sealed_async_activity_state.dart';

class Page4SealedClassBasedAsyncActivityProvider
    extends ConsumerStatefulWidget {
  const Page4SealedClassBasedAsyncActivityProvider({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SealedAsyncActivityPageState();
}

class _SealedAsyncActivityPageState
    extends ConsumerState<Page4SealedClassBasedAsyncActivityProvider> {
  Widget? prevWidget;

  @override
  Widget build(BuildContext context) {
    showDialogWhenErrorsOccurs(context);

    final activityState = ref.watch(sealedAsyncActivityProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'SealedAsyncActivityNotifier',
        actionIcons: const [Icons.refresh, Icons.add],
        actionCallbacks: [
          () =>
              ref.read(forErrorsSimulationCounterProvider.notifier).increment(),
          () => ref.invalidate(sealedAsyncActivityProvider),
        ],
      ),

      body: activityState.when(
        ///
        initial:
            () => const Center(
              child: TextWidget('Get some activity', TextType.titleMedium),
            ),

        ///
        loading: () => const AppMiniWidgets(MWType.loading),

        /// Failure state, displaying an error widget or fallback activity.
        failure:
            (error) =>
                prevWidget == null
                    ? const AppMiniWidgets(
                      MWType.error,
                      error: 'Get some activity',
                    )
                    : prevWidget!,

        ///
        success:
            (activities) =>
                prevWidget = ActivityWidget(activity: activities.first),
      ),

      ///
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(sealedAsyncActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: const TextWidget('New Activity', TextType.titleMedium),
      ),
    );
  }

  // * Show error alert dialog
  void showDialogWhenErrorsOccurs(BuildContext context) {
    ref.listen<SealedAsyncActivityState>(sealedAsyncActivityProvider, (
      previous,
      next,
    ) {
      switch (next) {
        case SealedAsyncActivityFailure(error: String error):
          DialogService.showAlertErrorDialog(context, error);
        case _:
      }
    });
  }
}
