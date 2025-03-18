import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_reminder/core/domain/config/app_config.dart';
import '../domain/change_notifier_provider.dart';
import '../domain/state_notifier_provider.dart';

class AppTextField extends HookConsumerWidget {
  const AppTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: textController,
        decoration: const InputDecoration(
          labelText:
              'New Todo ${AppConfig.isUsingStateNotifierProvider ? 'on State Notifier' : 'on Change Notifier'}',
        ),
        onSubmitted: (description) {
          if (description.isNotEmpty) {
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
