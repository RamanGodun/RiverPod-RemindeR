import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../widgets/error_dialog.dart'; // uses when use error dialog (without separate provider)
import '../../../core/domain/models/enums.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/models/activity.dart';
import '../domain/providers/dialog_provider.dart';
import '../domain/providers/enum_based_state/enum_activity_provider.dart';
import 'activity_widget.dart';


// StatefulWidget is used here to handle widget lifecycle and state changes
// when interacting with Riverpod providers.
class EnumActivityPage extends ConsumerStatefulWidget {
  const EnumActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnumActivityPageState();
}

class _EnumActivityPageState extends ConsumerState<EnumActivityPage> {
  @override
  void initState() {
    super.initState();
    //! The fetch method must be asynchronous (Future), otherwise,
    //! the widget lifecycle will be invalid.
    //! Changing a provider during the build phase could cause unwanted behaviors,
    //! so it's delayed until after the widget tree is built.
    Future.delayed(
        Duration.zero,
        () => ref
            .read(enumActivityProvider.notifier)
            .fetchActivity(activityTypes[0]));
  }

  @override
  Widget build(BuildContext context) {
    // Listening to changes in the EnumActivityState provider.
    // If the status transitions to 'failure', an error dialog is displayed.

    // listenForFailures(context); // error dialog can be called like this or next:
    // Access ErrorHandlingService and listen for failures
    ref.read(errorHandlingProvider).listenForFailures(ref, context);

    // Watching the current state of the provider.
    final activityState = ref.watch(enumActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EnumActivityNotifier'),
        actions: [
          // Button to increment the counter via MyCounter provider.
          // Useful for testing provider interaction.
          IconButton(
            onPressed: () => ref.read(myCounterProvider.notifier).increment(),
            icon: const Icon(Icons.add),
          ),
          // Button to refresh the enumActivityProvider and reset its state.
          IconButton(
            // onPressed: () => ref.invalidate(enumActivityProvider), //or can use this, depends what behavior we want
            onPressed: () => Future.delayed(
                Duration.zero,
                () => ref
                    .read(enumActivityProvider.notifier)
                    .fetchActivity(activityTypes[0])),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      // Different UI is rendered based on the current state of the provider.
      body: switch (activityState.status) {
        // Initial state, encouraging the user to fetch an activity.
        ActivityStatus.initial => const Center(
            child: TextWidget('Get some activity', TextType.titleMedium)),
        // Loading state, displaying a loading widget.
        ActivityStatus.loading => const AppMiniWidgets(MWType.loading),
        // Failure state, displaying an error widget or a fallback activity.
        //  when no available previous data => error widget
        // ! when failure happens, then available previous data are shown (good pattern)
        ActivityStatus.failure => activityState.activities.first ==
                Activity.empty()
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppMiniWidgets(MWType.error, error: activityState.error))
            : ActivityWidget(activity: activityState.activities.first),
        // Success state, displaying the fetched activity.
        ActivityStatus.success =>
          ActivityWidget(activity: activityState.activities.first),
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Randomly selects an activity type and fetches a new activity.
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(enumActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: const TextWidget('New Activity', TextType.titleMedium),
      ),
    );
  }

/* Methods next
 */
// Method to listen for any failures in the EnumActivityState provider and display an error dialog.
  // void listenForFailures(BuildContext context) {
  //   ref.listen<EnumActivityState>(
  //     enumActivityProvider,
  //     (previous, next) {
  //       if (next.status == ActivityStatus.failure && context.mounted) {
  //         ErrorDialog.show(context, next.error);
  //       }
  //     },
  //   );
  // }

  //
}
