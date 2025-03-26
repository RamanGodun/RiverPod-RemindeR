import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../domain/provider_with_using_local_states_for_each_item.dart';

/// A text field for adding new items to the global [itemsListProvider].
/// Uses hook-based [TextEditingController] for managing input.
class NewItemTextField extends HookConsumerWidget {
  const NewItemTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Add Item'),
      onSubmitted: (newItem) {
        if (newItem.trim().isNotEmpty) {
          ref.read(itemsListProvider.notifier).addItem(newItem);
          controller.clear();
        }
      },
    );
  }
}
