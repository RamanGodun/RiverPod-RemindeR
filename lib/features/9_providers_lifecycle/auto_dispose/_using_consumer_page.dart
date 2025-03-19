import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'providers_4_using_consumer_page.dart';

class PageToShowProductivityIncreasingWhenUseConsumerWidget
    extends ConsumerWidget {
  const PageToShowProductivityIncreasingWhenUseConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    ref.listen<int>(oneCounterProvider, (previous, next) {
      if (next % 3 == 0) {
        DialogService.showAlertErrorDialog(context, 'counter: $next');
      }
    });

    return Scaffold(
      appBar: const CustomAppBar(title: 'Using Consumer widget'),
      body: Center(
        /*
         * consumer widget is a cause, that provider doesn't rebuild every time => productivity growth
         * in case when used ConsumerWidget, provider rebuilds (initialized and cancelled/disposed) every time
          
          final counter = ref.watch(autoDisposeCounterProvider);
          final anotherCounter = ref.watch(anotherCounterProvider);
         */
        child: Consumer(
          builder: (context, ref, child) {
            final counter = ref.watch(oneCounterProvider);
            final anotherCounter = ref.watch(anotherCounterProvider);

            return Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: TextWidget(
                '$counter : $anotherCounter',
                TextType.headlineLarge,
              ),
            );
          },
        ),
      ),

      ///
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'autoDisposeCounterProvider',
              onPressed:
                  () => ref.read(oneCounterProvider.notifier).increment(),
              child: const Icon(Icons.add),
            ),

            FloatingActionButton(
              heroTag: 'anotherCounterProvider',
              onPressed:
                  () => ref.read(anotherCounterProvider.notifier).increment(),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
