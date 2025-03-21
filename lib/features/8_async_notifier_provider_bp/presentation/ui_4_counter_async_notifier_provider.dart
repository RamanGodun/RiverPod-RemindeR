import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/config/observer/extensions/async_value_xx.dart';
import 'package:riverpod_reminder/core/ui/widgets/buttons/outlined.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/config/app_config.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/counter/counter_on_async_notifier_gen_provider.dart';
import '../domain/counter/counter_on_async_notifier_manual_provider.dart';

class Page4CounterOnAsyncNotifierProvider extends ConsumerWidget {
  const Page4CounterOnAsyncNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Choosing the provider based on AppConfig setting.
    final counter =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(genCounterOnAsyncNotifierProvider(1))
            : ref.watch(counterOnAsyncNotifierManualProvider(1));

    // Printing the current state of AsyncValue using extension methods
    debugPrint('Counter state: ${counter.toString}');
    debugPrint('Counter props: ${counter.props}');

    return Scaffold(
      appBar: const CustomAppBar(
        title:
            'Counter on ${AppConfig.isUsingCodeGeneration ? 'gen' : 'manual'} async notifier',
      ),
      body: Center(
        child: counter.when(
          /// When the counter is refreshed, it will not skip the loading state
          skipLoadingOnRefresh: false,
          data: (countData) {
            // Logging the current counter value
            debugPrint('AsyncData count is: $countData');
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextWidget('Current count is: ', TextType.titleMedium),
                const SizedBox(height: 50),
                TextWidget('$countData', TextType.headlineLarge),
                const SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Button to decrement the counter value
                    FloatingActionButton(
                      heroTag: 'decrement',
                      onPressed:
                          () =>
                              AppConfig.isUsingCodeGeneration
                                  ? ref
                                      .read(
                                        genCounterOnAsyncNotifierProvider(
                                          1,
                                        ).notifier,
                                      )
                                      .decrement()
                                  : ref
                                      .read(
                                        counterOnAsyncNotifierManualProvider(
                                          1,
                                        ).notifier,
                                      )
                                      .decrement(),
                      child: const Icon(Icons.remove, size: 40),
                    ),
                    const SizedBox(width: 75),
                    // Button to increment the counter value
                    FloatingActionButton(
                      heroTag: 'increment',
                      onPressed:
                          () =>
                              AppConfig.isUsingCodeGeneration
                                  ? ref
                                      .read(
                                        genCounterOnAsyncNotifierProvider(
                                          1,
                                        ).notifier,
                                      )
                                      .increment()
                                  : ref
                                      .read(
                                        counterOnAsyncNotifierManualProvider(
                                          1,
                                        ).notifier,
                                      )
                                      .increment(),
                      child: const Icon(Icons.add, size: 40),
                    ),
                  ],
                ),
              ],
            );
          },

          ///
          error:
              (error, stackTrace) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(error.toString(), TextType.error),
                  const SizedBox(height: 50),
                  CustomOutlinedButton(
                    buttonText: 'Refresh',
                    onPressed:
                        () =>
                            AppConfig.isUsingCodeGeneration
                                ? ref.invalidate(
                                  genCounterOnAsyncNotifierProvider,
                                )
                                : ref.invalidate(
                                  counterOnAsyncNotifierManualProvider,
                                ),
                  ),
                ],
              ),

          ///
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }
}
