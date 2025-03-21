import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/counter_on_keep_alive_10_sec_provider.dart';

class Page4CounterOnSyncKeepAliveFor10SecProvider extends ConsumerWidget {
  const Page4CounterOnSyncKeepAliveFor10SecProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterOnKeepAlive10SecProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'SyncKeepAlive page'),
      body: Center(child: TextWidget('$counter', TextType.headlineLarge)),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () =>
                ref.read(counterOnKeepAlive10SecProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
