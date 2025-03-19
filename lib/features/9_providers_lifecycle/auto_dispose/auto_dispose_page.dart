import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'providers.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<int>(autoDisposeCounterProvider, (previous, next) {
      if (next % 3 == 0) {
        DialogService.showAlertErrorDialog(context, 'counter: $next');
      }
    });
    // in this case when used ConsumerWidget
    //provider rebuilds (initialized and cancelled/disposed) every time
    // final counter = ref.watch(autoDisposeCounterProvider);
    // final anotherCounter = ref.watch(anotherCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('AutoDispose', TextType.titleSmall),
      ),
      body: Center(
        //  consumer widget is a cause, that provider doesn't rebuild every time => productivity growth
        child: Consumer(
          builder: (context, ref, child) {
            final counter = ref.watch(autoDisposeCounterProvider);
            final anotherCounter = ref.watch(anotherCounterProvider);
            return TextWidget(
              '$counter : $anotherCounter',
              TextType.titleSmall,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed:
                () => ref.read(autoDisposeCounterProvider.notifier).increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed:
                () => ref.read(anotherCounterProvider.notifier).increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
