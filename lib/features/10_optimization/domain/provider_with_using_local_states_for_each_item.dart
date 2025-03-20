import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'models/item_model.dart';

part 'provider_with_using_local_states_for_each_item.g.dart';

@riverpod
class ItemsList extends _$ItemsList {
  @override
  List<Item> build() {
    return [];
  }

  /// Adds a new [Item] to the state.
  void addItem(String text) {
    final newItem = Item(text: text, createdAt: DateTime.now());
    state = [...state, newItem];
  }

  /// Removes an item by [text].
  void deleteItem(String text) {
    state = state.where((item) => item.text != text).toList();
  }
}

/// Provider that holds the local state of the currently scoped [Item].
/// Used within [ProviderScope] to provide each [ItemTile] widget
/// ! an isolated and independent state, so each [ItemTile] works **independently**,
/// ! reducing unnecessary rebuilds even when other items in the list are updated.
@Riverpod(dependencies: [])
Item currentItemLocalState(Ref ref) {
  throw UnimplementedError();
}


// ! BEFORE OPTIMIZATION  there was separate state (in separate file) 
/*
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_list_state.freezed.dart';

@freezed
class ItemListState with _$ItemListState {
  const factory ItemListState({
    required List<String> items,
  }) = _ItemListState;
}

@freezed
class ItemListState with _$ItemListState {
  const factory ItemListState({
    required String text,
    required DateTime createdAt,
  }) = _ItemListState;
}
 */
