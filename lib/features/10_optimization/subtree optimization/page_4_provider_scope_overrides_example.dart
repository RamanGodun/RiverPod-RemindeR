import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/buttons/outlined.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import 'provider_4_provider_scope_overrides_example.dart';

/// Demonstrates creating isolated instances of providers using different [ProviderScope] overrides.
///
/// ProviderScopes allow creating independent instances of providers,
/// enabling custom initialization and isolation of state for specific widgets or widget subtrees.
class Page4ProvidersOverrideExamples extends ConsumerWidget {
  const Page4ProvidersOverrideExamples({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Providers override page'),
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
            /// This instance is initialized with the default logic but is isolated
            /// from the global provider instance.
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

/// Reusable widget for incrementing and displaying the counter state.
class IncrementCounterSection extends ConsumerWidget {
  /// Amount by which the counter will increase when the button is pressed.
  final int incrementValue;

  /// Text label displayed on the increment button.
  final String label;

  const IncrementCounterSection({
    super.key,
    required this.incrementValue,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Reads the current state from the nearest [ProviderScope].
    final counter = ref.watch(baseCounterProvider);

    return Column(
      spacing: 10,
      children: [
        /// Displays the current counter value.
        TextWidget('$counter', TextType.headlineSmall),

        /// Button increments the counter by [incrementValue].
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
