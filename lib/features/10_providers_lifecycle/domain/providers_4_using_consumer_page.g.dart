// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_4_using_consumer_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$oneCounterHash() => r'fa29f03a4a29b189307d308f27c808f51f629d39';

/// 🧮 Counter with autoDispose lifecycle hooks
///
/// Copied from [OneCounter].
@ProviderFor(OneCounter)
final oneCounterProvider =
    AutoDisposeNotifierProvider<OneCounter, int>.internal(
  OneCounter.new,
  name: r'oneCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$oneCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OneCounter = AutoDisposeNotifier<int>;
String _$anotherCounterHash() => r'2bea0e75d239a973c27003b71a9a146b35e89a27';

/// 🔟 Counter with base value and lifecycle logging
///
/// Copied from [AnotherCounter].
@ProviderFor(AnotherCounter)
final anotherCounterProvider =
    AutoDisposeNotifierProvider<AnotherCounter, int>.internal(
  AnotherCounter.new,
  name: r'anotherCounterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$anotherCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AnotherCounter = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
