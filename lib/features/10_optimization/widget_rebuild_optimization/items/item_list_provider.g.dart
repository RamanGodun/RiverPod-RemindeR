// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentItemHash() => r'bc71b68dacf0fd9fa199ed5e30e359e748b6f5ef';

/// See also [currentItem].
@ProviderFor(currentItem)
final currentItemProvider = AutoDisposeProvider<Item>.internal(
  currentItem,
  name: r'currentItemProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentItemHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentItemRef = AutoDisposeProviderRef<Item>;
String _$itemListHash() => r'18f1df1194a95c986d4adbf406f8edb660f99e97';

/// See also [ItemList].
@ProviderFor(ItemList)
final itemListProvider =
    AutoDisposeNotifierProvider<ItemList, List<Item>>.internal(
      ItemList.new,
      name: r'itemListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$itemListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ItemList = AutoDisposeNotifier<List<Item>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
