// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_provider_gen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$genCounterOnNotifierHash() =>
    r'beb8fb86a71b41be0b8daee48f70b876dcb97733';

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

abstract class _$GenCounterOnNotifier extends BuildlessNotifier<int> {
  late final int initialValue;

  int build(int initialValue);
}

/// See also [GenCounterOnNotifier].
@ProviderFor(GenCounterOnNotifier)
const genCounterOnNotifierProvider = GenCounterOnNotifierFamily();

/// See also [GenCounterOnNotifier].
class GenCounterOnNotifierFamily extends Family<int> {
  /// See also [GenCounterOnNotifier].
  const GenCounterOnNotifierFamily();

  /// See also [GenCounterOnNotifier].
  GenCounterOnNotifierProvider call(int initialValue) {
    return GenCounterOnNotifierProvider(initialValue);
  }

  @override
  GenCounterOnNotifierProvider getProviderOverride(
    covariant GenCounterOnNotifierProvider provider,
  ) {
    return call(provider.initialValue);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'genCounterOnNotifierProvider';
}

/// See also [GenCounterOnNotifier].
class GenCounterOnNotifierProvider
    extends NotifierProviderImpl<GenCounterOnNotifier, int> {
  /// See also [GenCounterOnNotifier].
  GenCounterOnNotifierProvider(int initialValue)
    : this._internal(
        () => GenCounterOnNotifier()..initialValue = initialValue,
        from: genCounterOnNotifierProvider,
        name: r'genCounterOnNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$genCounterOnNotifierHash,
        dependencies: GenCounterOnNotifierFamily._dependencies,
        allTransitiveDependencies:
            GenCounterOnNotifierFamily._allTransitiveDependencies,
        initialValue: initialValue,
      );

  GenCounterOnNotifierProvider._internal(
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
  int runNotifierBuild(covariant GenCounterOnNotifier notifier) {
    return notifier.build(initialValue);
  }

  @override
  Override overrideWith(GenCounterOnNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: GenCounterOnNotifierProvider._internal(
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
  NotifierProviderElement<GenCounterOnNotifier, int> createElement() {
    return _GenCounterOnNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenCounterOnNotifierProvider &&
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
mixin GenCounterOnNotifierRef on NotifierProviderRef<int> {
  /// The parameter `initialValue` of this provider.
  int get initialValue;
}

class _GenCounterOnNotifierProviderElement
    extends NotifierProviderElement<GenCounterOnNotifier, int>
    with GenCounterOnNotifierRef {
  _GenCounterOnNotifierProviderElement(super.provider);

  @override
  int get initialValue => (origin as GenCounterOnNotifierProvider).initialValue;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
