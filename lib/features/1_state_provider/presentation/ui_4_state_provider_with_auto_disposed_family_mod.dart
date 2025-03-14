import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/state_provider_with_auto_disposed_family_mod.dart';

class Page4StateProviderWithAutoDisposedFamilyMod extends ConsumerWidget {
  const Page4StateProviderWithAutoDisposedFamilyMod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listening to changes and showing a dialog when the counter reaches dangerous values
    _showDialogWhenCounterEquals(ref, context, 70);
    _showDialogWhenCounterEquals(ref, context, -70);

    // Values for incrementing and decrementing
    final valueForIncrementing = 10;
    final valueForDecrementing = -10;

    // Watching familyAutoDisposedCounterProvider with different values
    final valueIncrementation = ref.watch(
      familyAutoDisposedCounterProvider(valueForIncrementing),
    );
    final valueDecrementation = ref.watch(
      familyAutoDisposedCounterProvider(valueForDecrementing),
    );

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'AutoDispose FamilyStateProvider',
          TextType.bodyLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(
              'Current value1 is: $valueIncrementation',
              TextType.button,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              child: const TextWidget('Increment (+10)', TextType.button),
              onPressed: () {
                // Increment the state by 10 using familyAutoDisposedCounterProvider
                ref
                    .read(
                      familyAutoDisposedCounterProvider(
                        valueForIncrementing,
                      ).notifier,
                    )
                    .update((state) => state + valueForIncrementing);
              },
            ),
            const SizedBox(height: 120),
            TextWidget(
              'Current value2 is: $valueDecrementation',
              TextType.button,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              child: const TextWidget('Decrement (-10)', TextType.button),
              onPressed: () {
                // Decrement the state by 10 using familyAutoDisposedCounterProvider
                ref
                    .read(
                      familyAutoDisposedCounterProvider(
                        valueForDecrementing,
                      ).notifier,
                    )
                    .update((state) => state + valueForDecrementing);
              },
            ),
          ],
        ),
      ),
    );
  }

  /*
   * General method to listen for changes in familyAutoDisposedCounterProvider
   * and show a dialog when the counter reaches a specified value.
   */
  void _showDialogWhenCounterEquals(
    WidgetRef ref,
    BuildContext context,
    int targetValue,
  ) {
    // Listening to the familyAutoDisposedCounterProvider with the given target value
    ref.listen<int>(
      familyAutoDisposedCounterProvider(targetValue.isNegative ? -10 : 10),
      (previous, next) {
        if (next == targetValue) {
          // Show a dialog when the counter reaches the specified value
          showDialog(
            context: context,
            builder:
                (context) => Center(
                  child: AlertDialog(
                    content: AppMiniWidgets(
                      MWType.error,
                      error: 'Number $next is dangerous!',
                    ),
                  ),
                ),
          );
        }
      },
    );
  }
}
