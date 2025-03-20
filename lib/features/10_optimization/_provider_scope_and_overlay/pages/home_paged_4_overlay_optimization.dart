import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/ui/widgets/buttons/custom_button.dart';
import '../../../../core/ui/widgets/text_widget.dart';
import 'counter_provider.dart';
import 'other_page.dart';

class HomePage4OverlayOptimization extends ConsumerWidget {
  const HomePage4OverlayOptimization({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('${ref.watch(counterProvider)}', TextType.headlineSmall),
            const Divider(height: 50),
            /*
            Displays the current value of the `counterProvider`.
            This value is fetched using `ref.watch`, ensuring that
            the widget rebuilds whenever `counterProvider` changes.
        */
            const TextWidget(
                'Unintended ProviderScope', TextType.headlineSmall),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*
                Opens a dialog box that uses the global `ProviderScope`.
                Since no custom `ProviderScope` is provided, the dialog
                will display the default value of `counterProvider` (e.g., `0`).
               */
                CustomButtonForDialog(
                    title: 'Dialog (gl.ctx)',
                    child: AlertDialog(
                      content: CounterDisplay(),
                    )),
                SizedBox(width: 10),
/*
Navigates to the `OtherPage`. Since no custom `ProviderScope`
                is passed, it will also use the global `ProviderScope`   
 */
                CustomButton(title: 'Other page (gl.ctx)', child: OtherPage()),
              ],
            ),
            const Divider(height: 50),
/*

 */
            const TextWidget('Intended ProviderScope', TextType.headlineSmall),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*
                Opens a dialog box but provides a custom `ProviderScope`
                with `parent: ProviderScope.containerOf(context)`.
                This ensures the dialog inherits the overridden `counterProvider`
                value (e.g., `100`) from the parent scope.
                  */
                CustomButtonForDialog(
                    title: 'Dialog (loc.ctx)',
                    child: ProviderScope(
                      parent: ProviderScope.containerOf(context),
                      child: const AlertDialog(
                        content: CounterDisplay(),
                      ),
                    )),
                const SizedBox(width: 10),
                /*
                Navigates to the `OtherPage` but with a custom `ProviderScope`.
                The `parent` ensures the `counterProvider` retains its overridden value
                */
                CustomButton(
                  title: 'Other page(loc.ctx)',
                  child: ProviderScope(
                    parent: ProviderScope.containerOf(context),
                    child: const OtherPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
/*
FloatingActionButton to increment the value of `counterProvider`.
      Updates are performed using `ref.read` to access the provider's notifier.
 */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterDisplay extends ConsumerWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
// A widget that displays the current value of `counterProvider`.
// It rebuilds automatically when the provider's state changes.
    return TextWidget('$counter', TextType.titleMedium);
  }
}
