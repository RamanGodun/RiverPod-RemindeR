import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/models/activity.dart';
import '../../../core/ui/widgets/activity_widget.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/on_sealed_class_based_async_notifier_provider/activity_on_async_notifier_provider.dart';

class AsyncActivityPage extends ConsumerWidget {
  const AsyncActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Call method to show dialog in case of error
    callDialogWhenErrorOccurs(ref, context);

    // Watch the state of asyncActivityProvider
    final activityState = ref.watch(asyncActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('AsyncActivityProvider', TextType.titleMedium),
        actions: [
          // Button to invalidate and refresh the asyncActivityProvider
          IconButton(
            onPressed: () => ref.invalidate(asyncActivityProvider),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: activityState.when(
        skipError:
            true, // Skip error display in the UI, as we handle it separately in a dialog
        skipLoadingOnRefresh: false, // Display loading indicator on refresh
        /* */
        data: (activity) => ActivityWidget(activity: activity),
        /* */
        error:
            (e, st) =>
                const AppMiniWidgets(MWType.error, error: 'Get some activity'),
        /* */
        loading: () => const AppMiniWidgets(MWType.loading),
      ),
      /* */
      /* */
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Fetch a new activity when the button is pressed
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
    // Listen to changes in asyncActivityProvider
    ref.listen<AsyncValue<Activity>>(asyncActivityProvider, (previous, next) {
      // If there's an error and it's not in a loading state, show the error dialog
      if (next.hasError && !next.isLoading) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: AppMiniWidgets(
                MWType.error,
                error: next.error.toString(),
              ),
            );
          },
        );
      }
    });
  }
}
