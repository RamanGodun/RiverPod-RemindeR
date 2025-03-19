import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'providers.dart';

class SyncKeepAlivePage extends ConsumerWidget {
  const SyncKeepAlivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(syncKeepAliveCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('SyncKeepAlive', TextType.titleSmall),
      ),
      body: Center(child: TextWidget('$counter', TextType.titleMedium)),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => ref.read(syncKeepAliveCounterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
