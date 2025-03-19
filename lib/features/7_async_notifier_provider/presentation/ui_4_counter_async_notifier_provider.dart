import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/config/extensions/async_value_xx.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
// import '_counter_provider.dart'; //when not using code generation
import '../domain/counter/counter_on_async_notifier_gen_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching the state of the counterProvider with an initial value of 10
    final counter = ref.watch(counterProvider(10));

    // Printing the current state of AsyncValue using extension methods
    print('Counter state: ${counter.toString}');
    print('Counter props: ${counter.props}');

    return Scaffold(
      appBar: AppBar(title: const TextWidget('Counter', TextType.titleMedium)),
      body: Center(
        child: counter.when(
          // When the counter is refreshed, it will not skip the loading state
          skipLoadingOnRefresh: false,
          data: (countData) {
            // Logging the current counter value
            print('AsyncData count is: $countData');
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextWidget('Current count is: ', TextType.headlineMedium),
                const SizedBox(height: 50),
                TextWidget('$countData', TextType.headlineMedium),
                const SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Button to decrement the counter value
                    FloatingActionButton(
                      heroTag: 'decrement',
                      onPressed:
                          () =>
                              ref
                                  .read(counterProvider(10).notifier)
                                  .decrement(),
                      child: const Icon(Icons.remove, size: 40),
                    ),
                    const SizedBox(width: 75),
                    // Button to increment the counter value
                    FloatingActionButton(
                      heroTag: 'increment',
                      onPressed:
                          () =>
                              ref
                                  .read(counterProvider(10).notifier)
                                  .increment(),
                      child: const Icon(Icons.add, size: 40),
                    ),
                  ],
                ),
              ],
            );
          },
          // Error state handling: Display the error message and a refresh button
          error:
              (error, stackTrace) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(error.toString(), TextType.error),
                  const SizedBox(height: 50),
                  // Button to refresh the counter provider in case of an error
                  OutlinedButton(
                    onPressed: () => ref.invalidate(counterProvider),
                    child: const TextWidget('Refresh', TextType.titleMedium),
                  ),
                ],
              ),
          // Loading state handling: Display a loading spinner
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }
}
