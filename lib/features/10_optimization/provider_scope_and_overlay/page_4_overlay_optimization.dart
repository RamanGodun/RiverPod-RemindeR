import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../../core/ui/widgets/buttons/custom_button.dart';
import '../../../../core/ui/widgets/text_widget.dart';
import 'counters_provider_for_scoping_and_overlay.dart';
import 'other_page.dart';

class PageToShowDependenceOfLocalAndGlobalContext extends ConsumerWidget {
  const PageToShowDependenceOfLocalAndGlobalContext({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Global and local context'),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 85),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 15,
            children: [
              const Divider(),
              const TextWidget(
                'Unintended ProviderScope',
                TextType.headlineSmall,
              ),
              const SizedBox(
                width: double.infinity,
                child: Wrap(
                  children: [
                    /*
                     * Opens a dialog box that uses the global `ProviderScope`.
                     * Since no custom `ProviderScope` is provided, the dialog
                     * will display the default value of `counterProvider` (e.g., `0`).
                     */
                    CustomButtonForDialog(
                      title: 'call dialog with gl.ctx',
                      child: AlertDialog(content: CounterDisplay()),
                    ),

                    /*
                     * Navigates to the `OtherPage`. Since no custom `ProviderScope`
                     * is passed, it will also use the global `ProviderScope`   
                     */
                    CustomButton(
                      title: 'to Other page with gl.ctx',
                      child: OtherPage(),
                    ),
                  ],
                ),
              ),

              ///
              const Divider(),
              const TextWidget(
                'Intended ProviderScope',
                TextType.headlineSmall,
              ),
              Wrap(
                children: [
                  /*
                   * Opens a dialog box but provides a custom `ProviderScope` with `parent: ProviderScope.containerOf(context)`
                   * This ensures the dialog inherits the overridden `counterProvider` value (e.g., `100`) from the parent scope
                   */
                  CustomButtonForDialog(
                    title: 'Call dialog with local ctx',
                    child: ProviderScope(
                      parent: ProviderScope.containerOf(context),
                      child: const AlertDialog(content: CounterDisplay()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  /*
                    Navigates to the `OtherPage` but with a custom `ProviderScope`.
                    The `parent` ensures the `counterProvider` retains its overridden value
                   */
                  CustomButton(
                    title: 'to Other page with loc.ctx',
                    child: ProviderScope(
                      parent: ProviderScope.containerOf(context),
                      child: const OtherPage(),
                    ),
                  ),
                ],
              ),

              ///
              const Divider(),
              const TextWidget(
                'Current counter value is: ',
                TextType.titleMedium,
              ),
              TextWidget(
                '${ref.watch(forOptimizationPageCounterProvider)}',
                TextType.headlineLarge,
              ),
            ],
          ),
        ),
      ),

      ///
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          onPressed: () {
            ref.read(forOptimizationPageCounterProvider.notifier).increment();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CounterDisplay extends ConsumerWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(forOptimizationPageCounterProvider);
    /*
     * It rebuilds automatically when the provider's state changes.
     */
    return TextWidget('$counter', TextType.titleMedium);
  }
}
