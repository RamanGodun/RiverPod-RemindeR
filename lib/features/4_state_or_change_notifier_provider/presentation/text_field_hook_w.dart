import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/domain/config/app_config.dart';
import '../domain/change_notifier_provider.dart';
import '../domain/state_notifier_provider.dart';

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
              'New Todos on ${AppConfig.isUsingStateNotifierProvider ? 'State notifier' : 'Change notifier'}',
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
