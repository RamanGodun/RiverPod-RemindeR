import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/config/app_config.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/change_notifier_provider.dart';
import '../domain/state_notifier_provider.dart';
import 'text_field_hook_w.dart';

part '_todos_widgets.dart';

/// 📄 Main Todos Page.
/// Switches between StateNotifier or ChangeNotifier based on config.
class TodosPageOnStateOrChangeNotifierProvider extends ConsumerWidget {
  const TodosPageOnStateOrChangeNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUsingStateNotifier = AppConfig.isUsingStateNotifierProvider;

    return Scaffold(
      appBar: const CustomAppBar(
        title:
            'Todos (on ${AppConfig.isUsingStateNotifierProvider ? 'State notifier' : 'Change notifier'})',
      ),
      body: Column(
        spacing: 20,
        children: [
          const CustomTextField(),
          Expanded(
            child:
                isUsingStateNotifier
                    ? const _TodoListOnStateNotifierProvider()
                    : const _TodoListOnChangeNotifierProvider(),
          ),
        ],
      ),
    );
  }
}

/// 📄 Todo List using StateNotifierProvider.
class _TodoListOnStateNotifierProvider extends ConsumerWidget {
  const _TodoListOnStateNotifierProvider();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosOnStateNotifierProvider);

    if (todos.isEmpty) {
      return const EmptyTodoMessage();
    }

    return ListView(
      shrinkWrap: true,
      key: const PageStorageKey('Todo list (on State Notifier)'),
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        for (final todo in todos)
          TodoItem(
            description: todo.description,
            completed: todo.completed,
            onToggle:
                () => ref
                    .read(todosOnStateNotifierProvider.notifier)
                    .toggleTodo(todo.id),
            onRemove:
                () => ref
                    .read(todosOnStateNotifierProvider.notifier)
                    .removeTodo(todo.id),
          ),
      ],
    );
  }
}

/// 📄 Todo List using ChangeNotifierProvider.
class _TodoListOnChangeNotifierProvider extends ConsumerWidget {
  const _TodoListOnChangeNotifierProvider();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosNotifier = ref.watch(todosOnChangeNotifierProvider);
    final todos = todosNotifier.todos;

    if (todos.isEmpty) {
      return const EmptyTodoMessage();
    }

    return ListView(
      shrinkWrap: true,
      key: const PageStorageKey('Todo list (on Change Notifier)'),
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        for (final todo in todos)
          TodoItem(
            description: todo.description,
            completed: todo.completed,
            onToggle:
                () =>
                    ref.read(todosOnChangeNotifierProvider).toggleTodo(todo.id),
            onRemove:
                () =>
                    ref.read(todosOnChangeNotifierProvider).removeTodo(todo.id),
          ),
      ],
    );
  }
}
