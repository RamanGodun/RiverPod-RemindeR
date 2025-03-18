import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/ui/widgets/text_widget.dart';
// import 'state_notifier_provider.dart'; // when using StateNotifier provider
import 'change_notifier_provider.dart';
import 'text_field.dart';

/// The `TodosPage` is responsible for displaying a list of todos.
/// It leverages `ConsumerWidget` to listen for changes in the state of the `todosProvider`,
/// and rebuilds when the state is updated.
class TodosPage extends ConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // When using ChangeNotifierProvider, we access the todos list directly from the provider's state.
    final todos = ref.watch(todosProvider).todos;
    // final todos = ref.watch(todosProvider); //when use state,notifier provider
    // print(todos);

    return Scaffold(
      appBar: AppBar(
        // Custom text widget for the app bar title.
        title: const TextWidget('Todos', TextType.titleMedium),
      ),
      body: Column(
        children: [
          // Custom text field for adding new todos.
          const AppTextField(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                // Iterating over the list of todos and displaying each one as a `CheckboxListTile`.
                for (final todo in todos)
                  CheckboxListTile(
                    visualDensity: VisualDensity.compact,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: todo.completed,
                    // Toggles the completed state of the todo when the checkbox is clicked.
                    onChanged:
                        (value) =>
                        // Using ChangeNotifierProvider to toggle the todo's completed state.
                        ref.read(todosProvider).toggleTodo(todo.id),
                    // ref.read(todosProvider.notifier).toggleTodo(todo.id) //when use state,notifier provider
                    title: TextWidget(todo.description, TextType.titleMedium),
                    // Icon button to delete a todo from the list.
                    secondary: IconButton(
                      onPressed:
                          () =>
                          // Using ChangeNotifierProvider to remove the todo from the list.
                          ref.read(todosProvider).removeTodo(todo.id),
                      // ref.read(todosProvider.notifier).removeTodo(todo.id) //when use state,notifier provider
                      icon: const Icon(Icons.delete),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
