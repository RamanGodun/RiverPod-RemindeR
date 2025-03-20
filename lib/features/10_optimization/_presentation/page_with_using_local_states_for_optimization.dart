import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../domain/provider_with_using_local_states_for_each_item.dart';
import 'text_field_for_new_item.dart';

class PageWithOptimizedLocalStatesForItems extends ConsumerWidget {
  const PageWithOptimizedLocalStatesForItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Optimized Local Item States'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [NewItemTextField(), Expanded(child: ItemListView())],
        ),
      ),
    );
  }
}

class ItemListView extends ConsumerWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsListProvider);

    return ListView(
      children: [
        for (final item in items)
          ProviderScope(
            /// Creates a separate isolated state for each item by overriding the [currentItemProvider].
            /// This ensures each item widget rebuilds independently,
            /// ! This dramatically reduces the number of re-renders in large lists.
            overrides: [currentItemLocalStateProvider.overrideWithValue(item)],
            child: const ItemTile(),
          ),
      ],
    );
  }
}

class ItemTile extends ConsumerWidget {
  const ItemTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Retrieves the isolated local state for this specific item.
    /// ! The widget will rebuild only when this particular item's state changes.
    final item = ref.watch(currentItemLocalStateProvider);
    debugPrint('building ${item.text}');

    return ListTile(
      dense: true,
      title: TextWidget(
        item.text,
        TextType.titleMedium,
        alignment: TextAlign.start,
      ),
      subtitle: TextWidget(
        'Created: ${Helpers.formatCreationDate(item.createdAt)}',
        TextType.bodySmall,
        isTextOnFewStrings: true,
        alignment: TextAlign.start,
      ),
      trailing: IconButton(
        onPressed: () {
          ref.read(itemsListProvider.notifier).deleteItem(item.text);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
