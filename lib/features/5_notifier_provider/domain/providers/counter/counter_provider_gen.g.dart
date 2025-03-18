// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_provider_gen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterOnNotifierHash() => r'b727f053d021068de674884cb2f601a93a24ef9e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CounterOnNotifier extends BuildlessAutoDisposeNotifier<int> {
  late final int initialValue;

  int build(
    int initialValue,
  );
}

/// See also [CounterOnNotifier].
@ProviderFor(CounterOnNotifier)
const counterOnNotifierProvider = CounterOnNotifierFamily();

/// See also [CounterOnNotifier].
class CounterOnNotifierFamily extends Family<int> {
  /// See also [CounterOnNotifier].
  const CounterOnNotifierFamily();

  /// See also [CounterOnNotifier].
  CounterOnNotifierProvider call(
    int initialValue,
  ) {
    return CounterOnNotifierProvider(
      initialValue,
    );
  }

  @override
  CounterOnNotifierProvider getProviderOverride(
    covariant CounterOnNotifierProvider provider,
  ) {
    return call(
      provider.initialValue,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'counterOnNotifierProvider';
}

/// See also [CounterOnNotifier].
class CounterOnNotifierProvider
    extends AutoDisposeNotifierProviderImpl<CounterOnNotifier, int> {
  /// See also [CounterOnNotifier].
  CounterOnNotifierProvider(
    int initialValue,
  ) : this._internal(
          () => CounterOnNotifier()..initialValue = initialValue,
          from: counterOnNotifierProvider,
          name: r'counterOnNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$counterOnNotifierHash,
          dependencies: CounterOnNotifierFamily._dependencies,
          allTransitiveDependencies:
              CounterOnNotifierFamily._allTransitiveDependencies,
          initialValue: initialValue,
        );

  CounterOnNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialValue,
  }) : super.internal();

  final int initialValue;

  @override
  int runNotifierBuild(
    covariant CounterOnNotifier notifier,
  ) {
    return notifier.build(
      initialValue,
    );
  }

  @override
  Override overrideWith(CounterOnNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CounterOnNotifierProvider._internal(
        () => create()..initialValue = initialValue,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialValue: initialValue,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CounterOnNotifier, int> createElement() {
    return _CounterOnNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CounterOnNotifierProvider &&
        other.initialValue == initialValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CounterOnNotifierRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `initialValue` of this provider.
  int get initialValue;
}

class _CounterOnNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CounterOnNotifier, int>
    with CounterOnNotifierRef {
  _CounterOnNotifierProviderElement(super.provider);

  @override
  int get initialValue => (origin as CounterOnNotifierProvider).initialValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
