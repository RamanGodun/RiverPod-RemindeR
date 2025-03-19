import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../../../core/domain/models/activity.dart';
import '../domain/providers/sealed_class_based_state/sealed_activity_provider.dart';
import '../domain/providers/sealed_class_based_state/sealed_activity_state.dart';
import '../../../core/ui/widgets/activity_widget.dart';

class SealedActivityPage extends ConsumerStatefulWidget {
  const SealedActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SealedActivityPageState();
}

class _SealedActivityPageState extends ConsumerState<SealedActivityPage> {
  // Caches the last successfully built widget.
  // ! In case of a failure, this cached widget is displayed to the user instead of an error message.
  Widget? prevWidget;

  @override
  void initState() {
    super.initState();
    // We use Future.delayed with Duration.zero to ensure that the provider's fetchActivity method
    // is called after the widget tree has been built. This avoids state modification during build.
    Future.delayed(Duration.zero, () {
      ref.read(sealedActivityProvider.notifier).fetchActivity(activityTypes[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen for changes in the provider's state and show an error dialog if needed.
    showErrorDialog(context);

    final activityState = ref.watch(sealedActivityProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'on sealed class Notifier',
        actionIcons: const [Icons.refresh],
        // Refresh button that invalidates the current state and forces a reload.
        actionCallbacks: [() => ref.invalidate(sealedActivityProvider)],
      ),

      body: switch (activityState) {
        ///
        SealedActivityInitial() => const Center(
          child: TextWidget('Get some activity', TextType.titleMedium),
        ),

        ///
        SealedActivityLoading() => const AppMiniWidgets(MWType.loading),

        ///
        SealedActivityFailure(error: String error) =>
          prevWidget ?? Center(child: TextWidget(error, TextType.error)),

        ///
        SealedActivitySuccess(activities: List<Activity> activities) =>
          _buildSuccessWidget(activities),
      },

      ///
      floatingActionButton: FloatingActionButton.extended(
        // Fetch a new random activity when the button is pressed.
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(sealedActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: const TextWidget('New Activity', TextType.titleMedium),
      ),
    );
  }

  /// ! Used methods

  Widget _buildSuccessWidget(List<Activity> activities) {
    final widget = ActivityWidget(activity: activities.first);
    prevWidget = widget;
    return widget;
  }

  // This method listens for changes in the SealedActivityState and shows an error dialog
  // if the state transitions to a failure. For other states, no action is taken.
  void showErrorDialog(BuildContext context) {
    ref.listen<SealedActivityState>(sealedActivityProvider, (previous, next) {
      switch (next) {
        case SealedActivityFailure(error: String error):
          DialogService.showAlertErrorDialog(context, error);
        case _: // No action is needed for other states.
      }
    });
  }

  /*
   ? When need dialog for a few states, use next:

  void showErrorDialogForFewStates(BuildContext context) {
    ref.listen<SealedActivityState>(sealedActivityProvider, (previous, next) {
      next.when(
        initial: () {},
        loading: () {},
        success: (activities) {},
        failure: (error) => DialogService.showAlertErrorDialog(context, error),
      );
    });
  }

  */
}
