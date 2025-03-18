import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/models/activity.dart';
import '../domain/providers/sealed_class_based_state/sealed_activity_provider.dart';
import '../domain/providers/sealed_class_based_state/sealed_activity_state.dart';
import 'activity_widget.dart';

// The main page that manages and displays the state of SealedActivityNotifier.
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
    //*  is called after the widget tree has been built. This avoids state modification during build.
    Future.delayed(Duration.zero, () {
      ref.read(sealedActivityProvider.notifier).fetchActivity(activityTypes[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen for changes in the provider's state and show an error dialog if needed.
    showErrorDialog(context);
    // Watch the current state of the sealedActivityProvider.
    final activityState = ref.watch(sealedActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('SealedActivityNotifier', TextType.titleSmall),
        actions: [
          // Refresh button that invalidates the current state and forces a reload.
          IconButton(
            onPressed: () => ref.invalidate(sealedActivityProvider),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      body: switch (activityState) {
        SealedActivityInitial() => const Center(
          child: TextWidget('Get some activity', TextType.titleMedium),
        ),
        SealedActivityLoading() => const AppMiniWidgets(MWType.loading),
        SealedActivityFailure(error: String error) =>
          prevWidget ?? Center(child: TextWidget(error, TextType.error)),
        SealedActivitySuccess(activities: List<Activity> activities) =>
          _buildSuccessWidget(activities),
      },
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

  /* Methods
     */
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
        // If the state is SealedActivityFailure, show an error dialog with the error message.
        case SealedActivityFailure(error: String error):
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: AppMiniWidgets(MWType.error, error: error),
              );
            },
          );
        /*
              * Not to show dialog for all other cases, used next: */
        case _:
        // No action is needed for other states.
      }
    });
  }

  /*
        * When need dialog for a few states, use next:

    void showErrorDialog(BuildContext context) {
    ref.listen<SealedActivityState>(
      sealedActivityProvider,
      (previous, next) {
        // Use `when` to handle multiple states and show a dialog for specific ones like `failure`.
        next.when(
          initial: () {
            //  No action needed for the initial state
          },
          loading: () {
            //  No action needed for the loading state
          },
          success: (activities) {
            //  No action needed for the success state
          },
          failure: (error) {
            // Show error dialog when failure occurs
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: TextWidgets.errorText(context, error),
                );
              },
            );
          },
        );
      },
    );
  }
  */
}
