import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/providers_4_using_consumer_page.dart';

class PageToShowProductivityIncreasingWhenUseConsumerWidget
    extends ConsumerWidget {
  const PageToShowProductivityIncreasingWhenUseConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _showDialogWhenCounterIsEqual3(ref, context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Using Consumer widget'),

      body: Center(
        /*
         ✅ Wrapping with [Consumer] improves performance:
         prevents full widget rebuild, only watches are reevaluated.
         Without it, providers may be unnecessarily disposed/re-initialized.
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

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // ➕ Increment OneCounter (0 → 1 → ...)
            FloatingActionButton(
              heroTag: 'oneCounter',
              onPressed:
                  () => ref.read(oneCounterProvider.notifier).increment(),
              child: const Icon(Icons.add),
            ),

            // ➕ Increment AnotherCounter (10 → 20 → ...)
            FloatingActionButton(
              heroTag: 'anotherCounter',
              onPressed:
                  () => ref.read(anotherCounterProvider.notifier).increment(),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  /// 🎯 Show alert every time counter reaches a multiple of 3
  void _showDialogWhenCounterIsEqual3(WidgetRef ref, BuildContext context) {
    ref.listen<int>(oneCounterProvider, (previous, next) {
      if (next % 3 == 0) {
        DialogService.showAlertErrorDialog(context, 'counter: $next');
      }
    });
  }
}
