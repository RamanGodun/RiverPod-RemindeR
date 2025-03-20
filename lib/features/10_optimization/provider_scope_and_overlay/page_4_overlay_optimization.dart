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
    final counter = ref.watch(autoDisposeCounterProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Global vs Local ProviderScope'),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              const TextWidget('Global ProviderScope', TextType.headlineSmall),

              /// Діалог без локального scope (скидається після закриття)
              const CustomButtonForDialog(
                title: 'Dialog (Global Scope)',
                child: AlertDialog(content: CounterDisplay()),
              ),

              /// Перехід на сторінку без локального scope (скидається після повернення)
              const CustomButton(
                title: 'Go to Other Page (Global Scope)',
                child: OtherPage(),
              ),

              const Divider(),
              const TextWidget('Local ProviderScope', TextType.headlineSmall),

              /// Діалог із локальним ProviderScope (стан зберігається)
              CustomButtonForDialog(
                title: 'Dialog (Local Scope)',
                child: ProviderScope(
                  parent: ProviderScope.containerOf(context),
                  child: const AlertDialog(content: CounterDisplay()),
                ),
              ),

              /// Перехід на сторінку із локальним ProviderScope (стан зберігається)
              CustomButton(
                title: 'Go to Other Page (Local Scope)',
                child: ProviderScope(
                  parent: ProviderScope.containerOf(context),
                  child: const OtherPage(),
                ),
              ),

              const Divider(),
              const SizedBox(height: 20),
              const TextWidget('Global Counter Value:', TextType.titleMedium),
              TextWidget('$counter', TextType.headlineLarge),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:
            () => ref.read(autoDisposeCounterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterDisplay extends ConsumerWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(autoDisposeCounterProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextWidget('Counter: $counter', TextType.titleMedium),
        const SizedBox(height: 10),
        TextWidget(
          'Widget: ${context.widget.runtimeType}',
          TextType.bodyMedium,
        ),
      ],
    );
  }
}
