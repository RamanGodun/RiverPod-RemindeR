import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'example1_provider.dart';

class Example1Page extends ConsumerWidget {
  const Example1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Usage Example 1', TextType.titleSmall),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AddOne(),
            const Divider(height: 50),
            ProviderScope(
// without overrides AddOne() and AddTen() will change one-the=same provider
              overrides: [ex1CounterProvider],
              child: const AddTen(),
            ),
            const Divider(height: 50),
            ProviderScope(
              overrides: [
                ex1CounterProvider.overrideWith(() => Ex1Counter100())
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
      children: [
        TextWidget('${ref.watch(ex1CounterProvider)}', TextType.headlineSmall),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            ref.read(ex1CounterProvider.notifier).increment(1);
          },
          child: const TextWidget('Add 1', TextType.titleSmall),
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
      children: [
        TextWidget('${ref.watch(ex1CounterProvider)}', TextType.headlineSmall),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            ref.read(ex1CounterProvider.notifier).increment(10);
          },
          child: const TextWidget('Add 10', TextType.titleSmall),
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
      children: [
        TextWidget('${ref.watch(ex1CounterProvider)}', TextType.headlineSmall),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            ref.read(ex1CounterProvider.notifier).increment(100);
          },
          child: const TextWidget('Add 100', TextType.titleSmall),
        ),
      ],
    );
  }
}
