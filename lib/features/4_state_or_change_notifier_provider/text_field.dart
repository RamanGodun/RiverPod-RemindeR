import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'change_notifier_provider.dart';

class AppTextField extends HookConsumerWidget {
  const AppTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Використовуємо useTextEditingController для автоматичного управління контролером
    final textController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: textController,
        decoration: const InputDecoration(labelText: 'New Todo'),
        onSubmitted: (description) {
          if (description.isNotEmpty) {
            // ref.read(todosProvider.notifier).addTodo(desc); // when with state notifier provider
            // ref.read(todosProvider
            //     .addTodo(description)); // when with change notifier provider
            ref.read(todosProvider.notifier).addTodo(description);
            textController.clear(); // Очищуємо поле після додавання
          }
        },
      ),
    );
  }
}
