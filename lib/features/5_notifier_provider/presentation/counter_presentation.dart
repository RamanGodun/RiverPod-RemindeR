import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/providers/counter/counter_provider_gen.dart';
// import '../providers/counter/counter_provider.dart'; //without code generation use this

class CounterPageOnNotifier extends ConsumerWidget {
  const CounterPageOnNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final counter = ref.watch(counterProviderOnNotifier(10)); //without code generation use this
    final counter = ref.watch(counterOnNotifierProvider(10));

    return Scaffold(
      appBar: AppBar(title: const TextWidget('Counter', TextType.titleSmall)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('$counter', TextType.headlineSmall),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed:
                  () => // ref.read(counterOnNotifierProvider(10).notifier).increment()  //without code generation use this
                      ref
                          .read(counterOnNotifierProvider(10).notifier)
                          .increment(),
              child: const TextWidget('Increment', TextType.titleMedium),
            ),
          ],
        ),
      ),
    );
  }
}
