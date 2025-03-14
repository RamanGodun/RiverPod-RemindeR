// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_3_plus_auto_dispose_family_mod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoDisposeFamilyHash() => r'30d741f4dc93c130d1f9ed444b1fec9f1c3f569b';

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

/// See also [autoDisposeFamily].
@ProviderFor(autoDisposeFamily)
const autoDisposeFamilyProvider = AutoDisposeFamilyFamily();

/// See also [autoDisposeFamily].
class AutoDisposeFamilyFamily extends Family<String> {
  /// See also [autoDisposeFamily].
  const AutoDisposeFamilyFamily();

  /// See also [autoDisposeFamily].
  AutoDisposeFamilyProvider call({
    required String customName,
  }) {
    return AutoDisposeFamilyProvider(
      customName: customName,
    );
  }

  @override
  AutoDisposeFamilyProvider getProviderOverride(
    covariant AutoDisposeFamilyProvider provider,
  ) {
    return call(
      customName: provider.customName,
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
  String? get name => r'autoDisposeFamilyProvider';
}

/// See also [autoDisposeFamily].
class AutoDisposeFamilyProvider extends AutoDisposeProvider<String> {
  /// See also [autoDisposeFamily].
  AutoDisposeFamilyProvider({
    required String customName,
  }) : this._internal(
          (ref) => autoDisposeFamily(
            ref as AutoDisposeFamilyRef,
            customName: customName,
          ),
          from: autoDisposeFamilyProvider,
          name: r'autoDisposeFamilyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$autoDisposeFamilyHash,
          dependencies: AutoDisposeFamilyFamily._dependencies,
          allTransitiveDependencies:
              AutoDisposeFamilyFamily._allTransitiveDependencies,
          customName: customName,
        );

  AutoDisposeFamilyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customName,
  }) : super.internal();

  final String customName;

  @override
  Override overrideWith(
    String Function(AutoDisposeFamilyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AutoDisposeFamilyProvider._internal(
        (ref) => create(ref as AutoDisposeFamilyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customName: customName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _AutoDisposeFamilyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AutoDisposeFamilyProvider && other.customName == customName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AutoDisposeFamilyRef on AutoDisposeProviderRef<String> {
  /// The parameter `customName` of this provider.
  String get customName;
}

class _AutoDisposeFamilyProviderElement
    extends AutoDisposeProviderElement<String> with AutoDisposeFamilyRef {
  _AutoDisposeFamilyProviderElement(super.provider);

  @override
  String get customName => (origin as AutoDisposeFamilyProvider).customName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
