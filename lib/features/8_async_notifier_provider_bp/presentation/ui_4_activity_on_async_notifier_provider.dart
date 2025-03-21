import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';

import '../../../core/domain/models/activity_model/activity.dart';
import '../../../core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/activity_widget.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/on_sealed_class_based_async_notifier_provider/activity_on_async_notifier_provider.dart';

class ActivityPageOnAsyncNotifierProvider extends ConsumerWidget {
  const ActivityPageOnAsyncNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    callDialogWhenErrorOccurs(ref, context);

    ///
    final activityState = ref.watch(asyncActivityProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'on async notifier provider',
        actionIcons: const [Icons.refresh],
        actionCallbacks: [() => ref.invalidate(asyncActivityProvider)],
      ),

      body: activityState.when(
        /// Skip error display in the UI, as we handle it separately in a dialog
        skipError: true,
        // Display loading indicator on refresh
        skipLoadingOnRefresh: false,

        ///
        data: (activity) => ActivityWidget(activity: activity),

        ///
        error:
            (e, st) =>
                const AppMiniWidgets(MWType.error, error: 'Get some activity'),

        ///
        loading: () => const AppMiniWidgets(MWType.loading),
      ),

      ///
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(asyncActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: const TextWidget('New Activity', TextType.titleMedium),
      ),
    );
  }

  //* Method to listen for errors and show a dialog when an error occurs.
  void callDialogWhenErrorOccurs(WidgetRef ref, BuildContext context) {
    ref.listen<AsyncValue<Activity>>(asyncActivityProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        DialogService.showAlertErrorDialog(context, next.error.toString());
      }
    });
  }
}
