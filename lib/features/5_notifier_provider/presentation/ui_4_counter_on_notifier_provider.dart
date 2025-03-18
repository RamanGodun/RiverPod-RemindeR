import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/config/app_config.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/buttons/outlined.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/providers/counter/counter_on_manual_notifier_provider.dart';
import '../domain/providers/counter/counter_on_gen_notifier_provider_gen.dart';

class CounterPageOnNotifier extends ConsumerWidget {
  const CounterPageOnNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(genCounterOnNotifierProvider(10))
            : ref.watch(counterOnManualNotifierProvider(10));

    return Scaffold(
      appBar: const CustomAppBar(
        title:
            'Counter on ${AppConfig.isUsingCodeGeneration ? 'gen' : 'manual'} provider',
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            const TextWidget('Current counter value is: ', TextType.titleLarge),
            TextWidget(
              '$counter',
              TextType.displayMedium,
              color: Helpers.getColorScheme(context).secondary,
            ),
            const SizedBox(height: 45),

            CustomOutlinedButton(
              buttonText: 'Increment',
              onPressed:
                  () =>
                      AppConfig.isUsingCodeGeneration
                          ? ref
                              .read(GenCounterOnNotifierProvider(10).notifier)
                              .increment()
                          : ref
                              .read(
                                counterOnManualNotifierProvider(10).notifier,
                              )
                              .increment(),
            ),
          ],
        ),
      ),
    );
  }
}
