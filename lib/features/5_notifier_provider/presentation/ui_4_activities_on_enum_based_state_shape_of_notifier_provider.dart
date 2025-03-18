import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/models/enums.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/models/activity.dart';
import '../../../core/domain/state/errors_dialog_providers.dart';
import '../domain/providers/enum_based_state/enum_activity_provider.dart';
import '../../../core/ui/widgets/activity_widget.dart';

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
    //! The fetch method must be asynchronous (Future), otherwise, the widget lifecycle will be invalid.
    //! Changing a provider during the build phase could cause unwanted behaviors,  so it's delayed until after the widget tree is built.
    Future.delayed(
      Duration.zero,
      () => ref
          .read(enumActivityProvider.notifier)
          .fetchActivity(activityTypes[0]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If the status transitions to 'failure', an error dialog is displayed.
    ref
        .read(errorsHandlingProvider4EnumActivityState)
        .listenForFailures(ref, context);

    final activityState = ref.watch(enumActivityProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'EnumActivityNotifier',
        actionIcons: const [Icons.add, Icons.refresh],
        actionCallbacks: [
          () => ref.read(myCounterProvider.notifier).increment(),
          () => Future.delayed(
            Duration.zero,
            () => ref
                .read(enumActivityProvider.notifier)
                .fetchActivity(activityTypes[0]),
          ),
          // ? onPressed: () => ref.invalidate(enumActivityProvider), //or can use this, depends what behavior we want
        ],
      ),

      body: switch (activityState.status) {
        ///
        ActivityStatus.initial => const Center(
          child: TextWidget('Get some activity', TextType.titleMedium),
        ),

        ///
        ActivityStatus.loading => const AppMiniWidgets(MWType.loading),

        /// Failure state, displaying an error widget or a fallback activity, when no available previous data => error widget
        // ! when failure happens, then available previous data are shown (good pattern)
        ActivityStatus.failure =>
          activityState.activities.first == Activity.empty()
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppMiniWidgets(MWType.error, error: activityState.error),
              )
              : ActivityWidget(activity: activityState.activities.first),

        /// Success state, displaying the fetched activity.
        ActivityStatus.success => ActivityWidget(
          activity: activityState.activities.first,
        ),
      },

      ///
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
}
