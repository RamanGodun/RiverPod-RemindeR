// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_with_using_local_states_for_each_item.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentItemLocalStateHash() =>
    r'e95ca0f7afd9a6aed1a3bdfd07cd16c150f1ae6b';

/// Provider that holds the local state of the currently scoped [Item].
/// Used within [ProviderScope] to provide each [ItemTile] widget
/// ! an isolated and independent state, so each [ItemTile] works **independently**,
/// ! reducing unnecessary rebuilds even when other items in the list are updated.
///
/// Copied from [currentItemLocalState].
@ProviderFor(currentItemLocalState)
final currentItemLocalStateProvider = AutoDisposeProvider<Item>.internal(
  currentItemLocalState,
  name: r'currentItemLocalStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentItemLocalStateHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentItemLocalStateRef = AutoDisposeProviderRef<Item>;
String _$itemsListHash() => r'2c4f412459b0f7ab914827e276fdb44addb90199';

/// See also [ItemsList].
@ProviderFor(ItemsList)
final itemsListProvider =
    AutoDisposeNotifierProvider<ItemsList, List<Item>>.internal(
  ItemsList.new,
  name: r'itemsListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ItemsList = AutoDisposeNotifier<List<Item>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
