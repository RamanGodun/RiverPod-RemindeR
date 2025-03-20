// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example2_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ex2AdjustedCounterHash() =>
    r'7baa8cc193c743112a6a1c951342f342b0fa925f';

/// See also [ex2AdjustedCounter].
@ProviderFor(ex2AdjustedCounter)
final ex2AdjustedCounterProvider = AutoDisposeProvider<int>.internal(
  ex2AdjustedCounter,
  name: r'ex2AdjustedCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$ex2AdjustedCounterHash,
  dependencies: <ProviderOrFamily>[ex2CounterProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    ex2CounterProvider,
    ...?ex2CounterProvider.allTransitiveDependencies,
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef Ex2AdjustedCounterRef = AutoDisposeProviderRef<int>;
String _$ex2CounterHash() => r'54778f6f5960adab330b8bbbb8afe2ec61e1fbf6';

/// See also [Ex2Counter].
@ProviderFor(Ex2Counter)
final ex2CounterProvider = NotifierProvider<Ex2Counter, int>.internal(
  Ex2Counter.new,
  name: r'ex2CounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ex2CounterHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef _$Ex2Counter = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
