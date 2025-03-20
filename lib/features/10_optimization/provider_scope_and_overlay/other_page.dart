import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import 'counters_provider_for_scoping_and_overlay.dart';

class OtherPage extends ConsumerWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(autoDisposeCounterProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Other Page'),
      body: Center(
        child: Text('Counter: $counter', style: const TextStyle(fontSize: 36)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => ref.read(autoDisposeCounterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
