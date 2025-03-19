import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'providers.dart';

class KeepAlivePage extends ConsumerWidget {
  const KeepAlivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(keepAliveCounterProvider);

    return Scaffold(
      appBar: AppBar(title: const TextWidget('KeepAlive', TextType.titleSmall)),
      body: Center(child: TextWidget('$counter', TextType.titleMedium)),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => ref.read(keepAliveCounterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
