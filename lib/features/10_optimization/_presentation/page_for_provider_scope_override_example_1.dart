import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/buttons/outlined.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import '../domain/subtree_optimization/provider_4_provider_scope_overrides_example.dart';

/// Demonstrates creating isolated instances of providers using different [ProviderScope] overrides.
/// ProviderScopes allow creating independent instances of providers,
/// enabling custom initialization and isolation of state for specific widgets or widget subtrees.
class Page4FirstExampleOfProvidersOverride extends ConsumerWidget {
  const Page4FirstExampleOfProvidersOverride({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Providers override example 1'),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const TextWidget(
              'All counters below use the same provider but demonstrate different behaviors using ProviderScope overrides.',
              TextType.titleMedium,
              isTextOnFewStrings: true,
            ),
            const Divider(height: 50),

            /// Default global instance of [BaseCounter] provider (initial value: 0).
            /// This counter state is shared across the entire app.
            const IncrementCounterSection(incrementValue: 1, label: 'Add 1'),
            const Divider(height: 50),

            /// Creates a new isolated provider instance within a [ProviderScope].
            /// This instance is initialized with the default logic but is isolated from the global provider instance.
            /// without overrides two widgets will change one-the-same provider
            ProviderScope(
              overrides: [baseCounterProvider],
              child: const IncrementCounterSection(
                incrementValue: 10,
                label: 'Add 10',
              ),
            ),
            const Divider(height: 50),

            /// Creates another isolated provider instance with customized initialization.
            /// The initial state is set to 100 using class inheritance.
            ProviderScope(
              overrides: [
                baseCounterProvider.overrideWith(
                  () => BaseCounterStartingAt100(),
                ),
              ],
              child: const IncrementCounterSection(
                incrementValue: 100,
                label: 'Add 100',
              ),
            ),
            const Divider(height: 50),
          ],
        ),
      ),
    );
  }
}

/// Widget for incrementing and displaying counter values.
class IncrementCounterSection extends ConsumerWidget {
  /// Amount by which the counter will increment.
  final int incrementValue;

  /// Label displayed on the increment button.
  final String label;

  const IncrementCounterSection({
    super.key,
    required this.incrementValue,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watches the counter's current state from the nearest [ProviderScope].
    final counter = ref.watch(baseCounterProvider);

    return Column(
      spacing: 10,
      children: [
        /// Displays the current counter value.
        TextWidget('$counter', TextType.headlineSmall),

        /// Button to increment the counter by [incrementValue].
        CustomOutlinedButton(
          buttonText: label,
          onPressed:
              () => ref
                  .read(baseCounterProvider.notifier)
                  .increment(incrementValue),
        ),
      ],
    );
  }
}
