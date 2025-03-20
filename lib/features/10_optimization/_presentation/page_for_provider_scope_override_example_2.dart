import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/buttons/outlined.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import '../domain/subtree_optimization/provider_4_provider_scope_overrides_example.dart';

/// Demonstrates different instances of [SecondBaseCounter] and derived providers using ProviderScope overrides.
class Page4SecondExampleOfProvidersOverride extends ConsumerWidget {
  const Page4SecondExampleOfProvidersOverride({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Providers override example 2'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Isolated instance of [SecondBaseCounter] with default initial value (0).
            const Divider(height: 30),
            ProviderScope(
              overrides: [secondBaseCounterProvider],
              child: const CounterDisplay('1X | 2X (from 0)'),
            ),
            const Divider(height: 40),

            /// Isolated instance of [SecondBaseCounter] initialized at 10.
            ProviderScope(
              overrides: [
                secondBaseCounterProvider.overrideWith(
                  () => SecondBaseCounterStartingAt10(),
                ),
              ],
              child: const CounterDisplay('1X | 2X (from 10)'),
            ),
            const Divider(height: 40),

            /// Isolated instance of [SecondBaseCounter] initialized at 100,
            /// with a custom multiplier for [doubledSecondBaseCounterProvider].
            ProviderScope(
              overrides: [
                secondBaseCounterProvider.overrideWith(
                  () => SecondBaseCounterStartingAt100(),
                ),
                doubledSecondBaseCounterProvider.overrideWith(
                  (ref) => ref.watch(secondBaseCounterProvider) * 3,
                ),
              ],
              child: const CounterDisplay('1X | 3X (from 100)'),
            ),
            const Divider(height: 40),

            /// Global instance of [SecondBaseCounter] without any overrides.
            const CounterDisplay('1X | 2X (from 0)'),
            const Divider(height: 40),
          ],
        ),
      ),
    );
  }
}

/// Widget displaying current state of the counter and the adjusted counter.
class CounterDisplay extends ConsumerWidget {
  final String buttonTextAdding;
  const CounterDisplay(this.buttonTextAdding, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(secondBaseCounterProvider);
    final adjustedCounter = ref.watch(doubledSecondBaseCounterProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('Counter: $counter', TextType.titleMedium),
            const SizedBox(width: 30),
            TextWidget('Adjusted: $adjustedCounter', TextType.titleMedium),
          ],
        ),

        CustomOutlinedButton(
          buttonText: 'mode: $buttonTextAdding',
          onPressed:
              () => ref.read(secondBaseCounterProvider.notifier).increment(),
        ),

        ///
      ],
    );
  }
}
