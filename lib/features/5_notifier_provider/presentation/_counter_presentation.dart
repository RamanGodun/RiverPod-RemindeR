import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/config/app_config.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/providers/counter/counter_provider.dart';
import '../domain/providers/counter/counter_provider_gen.dart';
// import '../providers/counter/counter_provider.dart'; //without code generation use this

class CounterPageOnNotifier extends ConsumerWidget {
  const CounterPageOnNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(GenCounterOnNotifierProvider(10))
            : ref.watch(ManualCounterOnNotifier(10));

    return Scaffold(
      appBar: const CustomAppBar(
        title:
            'Counter on ${AppConfig.isUsingCodeGeneration ? 'gen' : 'manual'} provider',
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('$counter', TextType.displayMedium),

            OutlinedButton(
              onPressed:
                  () =>
                      AppConfig.isUsingCodeGeneration
                          ?
                          // without code generation use this
                          ref
                              .read(GenCounterOnNotifierProvider(10).notifier)
                              .increment()
                          : ref
                              .read(ManualCounterOnNotifier(10).notifier)
                              .increment(),
              child: const TextWidget('Increment', TextType.titleMedium),
            ),
          ],
        ),
      ),
    );
  }
}
