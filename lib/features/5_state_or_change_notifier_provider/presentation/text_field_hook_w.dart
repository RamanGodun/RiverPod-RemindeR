import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/domain/config/app_config.dart';
import '../domain/change_notifier_provider.dart';
import '../domain/state_notifier_provider.dart';

/// 📄 Reusable text field for adding new todos.
/// Dynamically switches between StateNotifier and ChangeNotifier based on config.
class CustomTextField extends HookConsumerWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: textController,
        decoration: const InputDecoration(
          labelText:
              'New Todo on ${AppConfig.isUsingStateNotifierProvider ? 'StateNotifier' : 'ChangeNotifier'}',
        ),
        onSubmitted: (description) {
          if (description.isNotEmpty) {
            // Add todo based on configured provider type
            AppConfig.isUsingStateNotifierProvider
                ? ref
                    .read(todosOnStateNotifierProvider.notifier)
                    .addTodo(description)
                : ref
                    .read(todosOnChangeNotifierProvider.notifier)
                    .addTodo(description);

            textController.clear();
          }
        },
      ),
    );
  }
}
