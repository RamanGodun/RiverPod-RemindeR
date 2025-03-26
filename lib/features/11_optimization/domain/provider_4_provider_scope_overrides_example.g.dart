// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_4_provider_scope_overrides_example.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$doubledSecondBaseCounterHash() =>
    r'dc599089927b18da7526cebb22b01234d123a936';

/// Derived provider calculating double the state of [SecondBaseCounter].
///
/// Copied from [doubledSecondBaseCounter].
@ProviderFor(doubledSecondBaseCounter)
final doubledSecondBaseCounterProvider = AutoDisposeProvider<int>.internal(
  doubledSecondBaseCounter,
  name: r'doubledSecondBaseCounterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$doubledSecondBaseCounterHash,
  dependencies: <ProviderOrFamily>[secondBaseCounterProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    secondBaseCounterProvider,
    ...?secondBaseCounterProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DoubledSecondBaseCounterRef = AutoDisposeProviderRef<int>;
String _$baseCounterHash() => r'94b0346914b645172751e192584a317465ddad9a';

/// A simple integer counter with customizable initial value.
///
/// Copied from [BaseCounter].
@ProviderFor(BaseCounter)
final baseCounterProvider = NotifierProvider<BaseCounter, int>.internal(
  BaseCounter.new,
  name: r'baseCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$baseCounterHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef _$BaseCounter = Notifier<int>;
String _$secondBaseCounterHash() => r'9d1b9a007cbb6db6fe5602e9a07e0284c40ce645';

/// Another basic counter provider with a default initial state of 0.
///
/// Copied from [SecondBaseCounter].
@ProviderFor(SecondBaseCounter)
final secondBaseCounterProvider =
    NotifierProvider<SecondBaseCounter, int>.internal(
  SecondBaseCounter.new,
  name: r'secondBaseCounterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$secondBaseCounterHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef _$SecondBaseCounter = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
