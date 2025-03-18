import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/config/app_config.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/change_notifier_provider.dart';
import '../domain/state_notifier_provider.dart';
import 'text_field_widget.dart';

class TodosPageOnStateOrChangeNotifierProvider extends ConsumerWidget {
  const TodosPageOnStateOrChangeNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUsingStateNotifier = AppConfig.isUsingStateNotifierProvider;

    return Scaffold(
      appBar: const CustomAppBar(
        title:
            'Todos ${AppConfig.isUsingStateNotifierProvider ? 'on State Notifier' : 'on Change Notifier'}',
      ),
      body: Column(
        spacing: 20,
        children: [
          const AppTextField(),

          Expanded(
            child:
                isUsingStateNotifier
                    ? _buildStateNotifierList(ref)
                    : _buildChangeNotifierList(ref),
          ),
        ],
      ),
    );
  }

  Widget _buildStateNotifierList(WidgetRef ref) {
    final todos = ref.watch(todosOnStateNotifierProvider);
    if (todos.isEmpty) {
      return const Center(
        child: TextWidget('List is empty, add todo 👆', TextType.bodyLarge),
      );
    }
    return ListView(
      children: [
        for (final todo in todos)
          CheckboxListTile(
            visualDensity: VisualDensity.compact,
            controlAffinity: ListTileControlAffinity.leading,
            value: todo.completed,
            onChanged:
                (_) => ref
                    .read(todosOnStateNotifierProvider.notifier)
                    .toggleTodo(todo.id),
            title: TextWidget(
              todo.description,
              TextType.titleMedium,
              alignment: TextAlign.start,
            ),
            secondary: IconButton(
              onPressed:
                  () => ref
                      .read(todosOnStateNotifierProvider.notifier)
                      .removeTodo(todo.id),
              icon: const Icon(Icons.delete),
            ),
          ),
      ],
    );
  }

  Widget _buildChangeNotifierList(WidgetRef ref) {
    final todosNotifier = ref.watch(todosOnChangeNotifierProvider);
    final todos = todosNotifier.todos;
    if (todos.isEmpty) {
      return const Center(
        child: TextWidget('List is empty, add todo 👆', TextType.titleMedium),
      );
    }
    return ListView(
      children: [
        for (final todo in todos)
          CheckboxListTile(
            visualDensity: VisualDensity.compact,
            controlAffinity: ListTileControlAffinity.leading,
            value: todo.completed,
            onChanged:
                (_) =>
                    ref.read(todosOnChangeNotifierProvider).toggleTodo(todo.id),
            title: TextWidget(todo.description, TextType.titleMedium),
            secondary: IconButton(
              onPressed:
                  () => ref
                      .read(todosOnChangeNotifierProvider)
                      .removeTodo(todo.id),
              icon: const Icon(Icons.delete),
            ),
          ),
      ],
    );
  }
}
