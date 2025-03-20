import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../items/item_list_provider.dart';

class ShowItems extends ConsumerWidget {
  const ShowItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemListProvider);

    return ListView(
      children: [
        for (final item in items)
          ProviderScope(
/*
`ShowItems` widget:
- Uses `ref.watch(itemListProvider)` to get the list of items.
- For each item in the list, wraps the corresponding widget (`EachItem`) in a `ProviderScope`.
- `ProviderScope` overrides `currentItemProvider` with the specific item, creating an isolated state for it.
- This mechanism ensures that changes to one item do not cause the entire list to re-render, only the affected item will rebuild.
 */
            overrides: [currentItemProvider.overrideWithValue(item)],
            child: const EachItem(),
          )
      ],
    );
  }
}

class EachItem extends ConsumerWidget {
  const EachItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
/*
`EachItem` widget:
- Uses `ref.watch(currentItemProvider)` to fetch the specific item associated with this widget.
- `currentItemProvider` ensures that `EachItem` works only with its assigned item, providing state isolation.
- As a result, even if other items in the list change, this widget won't rebuild unless its state changes.
- This drastically reduces the number of re-renders in large lists.
 */

    final item = ref.watch(currentItemProvider);
    print('building ${item.text}');

    return ListTile(
      title: Text(
        item.text,
        style: const TextStyle(fontSize: 18.0),
      ),
      subtitle: Text(
        'Дата створення: ${item.createdAt}',
        style: const TextStyle(fontSize: 14.0, color: Colors.grey),
      ),
      trailing: IconButton(
        onPressed: () {
          ref.read(itemListProvider.notifier).deleteItem(item.text);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
