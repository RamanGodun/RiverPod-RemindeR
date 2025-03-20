import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/buttons/outlined.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'example1_provider.dart';

class Example1Page extends ConsumerWidget {
  const Example1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Usage Example 1'),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget(
              'All this counters are provider by One the same Provider',
              TextType.titleMedium,
              isTextOnFewStrings: true,
            ),

            const Divider(height: 50),
            const AddOne(),

            const Divider(height: 50),
            ProviderScope(
              // without overrides AddOne() and AddTen() will change one-the=same provider
              overrides: [counterForExample1PageProvider],
              child: const AddTen(),
            ),
            const Divider(height: 50),
            ProviderScope(
              overrides: [
                counterForExample1PageProvider.overrideWith(
                  () => Counter100ForExample1Page(),
                ),
              ],
              child: const AddHundred(),
            ),
          ],
        ),
      ),
    );
  }
}

class AddOne extends ConsumerWidget {
  const AddOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 10,
      children: [
        TextWidget(
          '${ref.watch(counterForExample1PageProvider)}',
          TextType.headlineSmall,
        ),

        CustomOutlinedButton(
          buttonText: 'Add 1',
          onPressed:
              () => ref
                  .read(counterForExample1PageProvider.notifier)
                  .increment(1),
        ),
      ],
    );
  }
}

class AddTen extends ConsumerWidget {
  const AddTen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 10,
      children: [
        TextWidget(
          '${ref.watch(counterForExample1PageProvider)}',
          TextType.headlineSmall,
        ),

        CustomOutlinedButton(
          buttonText: 'Add 10',
          onPressed:
              () => ref
                  .read(counterForExample1PageProvider.notifier)
                  .increment(10),
        ),
      ],
    );
  }
}

class AddHundred extends ConsumerWidget {
  const AddHundred({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 10,
      children: [
        TextWidget(
          '${ref.watch(counterForExample1PageProvider)}',
          TextType.headlineSmall,
        ),

        CustomOutlinedButton(
          buttonText: 'Add 100',
          onPressed:
              () => ref
                  .read(counterForExample1PageProvider.notifier)
                  .increment(100),
        ),
      ],
    );
  }
}
