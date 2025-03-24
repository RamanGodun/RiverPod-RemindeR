part of '_todos_ui.dart';

/// 📝 Single Todo item widget.
/// Works for both StateNotifier & ChangeNotifier implementations.
class TodoItem extends StatelessWidget {
  final String description;
  final bool completed;
  final VoidCallback onToggle;
  final VoidCallback onRemove;

  const TodoItem({
    super.key,
    required this.description,
    required this.completed,
    required this.onToggle,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      visualDensity: VisualDensity.compact,
      controlAffinity: ListTileControlAffinity.leading,
      value: completed,
      onChanged: (_) => onToggle(),
      title: TextWidget(
        description,
        TextType.titleMedium,
        alignment: TextAlign.start,
      ),
      secondary: IconButton(
        onPressed: onRemove,
        icon: const Icon(Icons.delete),
      ),
    );
  }
}

/// 📭 Message displayed when todo list is empty.
class EmptyTodoMessage extends StatelessWidget {
  const EmptyTodoMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidget('List is empty, add todo 👆', TextType.bodyLarge),
    );
  }
}
