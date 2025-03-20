import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/item_model.dart';

part 'item_list_provider.g.dart';

/*
This provider stores a list of items (`List<Item>`), where each item is represented by the `Item` model.
- `addItem`: Adds a new item to the list with the current timestamp (`createdAt`).
- `deleteItem`: Removes an item from the list based on its `text` property.
The state is updated using immutable list operations to ensure proper state management.
 */

@riverpod
class ItemList extends _$ItemList {
  @override
  List<Item> build() {
    return [];
  }

  void addItem(String text) {
    final newItem = Item(text: text, createdAt: DateTime.now());
    state = [...state, newItem];
  }

  void deleteItem(String text) {
    state = state.where((item) => item.text != text).toList();
  }
}

/*
`currentItemProvider`:
- A generated provider that creates a **local state** for each element in the list.
- Used within `ProviderScope` to "bind" the specific element of the list with the `EachItem` widget.
- This ensures that each `EachItem` works **independently**, reducing unnecessary rebuilds when other items in the list are updated.
 */
@Riverpod(dependencies: [])
Item currentItem(Ref ref) {
  throw UnimplementedError();
}
