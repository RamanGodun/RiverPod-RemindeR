import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/presentation/widgets/text_widget.dart';
import '../domain/cascade_providers.dart';

class CascadeProvidersPage extends ConsumerWidget {
  const CascadeProvidersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAge = ref.watch(ageProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Cascade Provider'),
      body: Center(
        child: TextWidget(
          myAge,
          TextType.titleMedium,
          isTextOnFewStrings: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(cascadeCounterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
