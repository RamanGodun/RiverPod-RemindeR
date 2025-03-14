// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_with_auto_disposed_and_family_mods_gen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoDisposeFamilyHash() => r'9a229f180203b173c9a926ac7a342e7a6235665d';

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
  AutoDisposeFamilyProvider call({required String customizedText}) {
    return AutoDisposeFamilyProvider(customizedText: customizedText);
  }

  @override
  AutoDisposeFamilyProvider getProviderOverride(
    covariant AutoDisposeFamilyProvider provider,
  ) {
    return call(customizedText: provider.customizedText);
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
  AutoDisposeFamilyProvider({required String customizedText})
    : this._internal(
        (ref) => autoDisposeFamily(
          ref as AutoDisposeFamilyRef,
          customizedText: customizedText,
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
        customizedText: customizedText,
      );

  AutoDisposeFamilyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customizedText,
  }) : super.internal();

  final String customizedText;

  @override
  Override overrideWith(String Function(AutoDisposeFamilyRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: AutoDisposeFamilyProvider._internal(
        (ref) => create(ref as AutoDisposeFamilyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customizedText: customizedText,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _AutoDisposeFamilyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AutoDisposeFamilyProvider &&
        other.customizedText == customizedText;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customizedText.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AutoDisposeFamilyRef on AutoDisposeProviderRef<String> {
  /// The parameter `customizedText` of this provider.
  String get customizedText;
}

class _AutoDisposeFamilyProviderElement
    extends AutoDisposeProviderElement<String>
    with AutoDisposeFamilyRef {
  _AutoDisposeFamilyProviderElement(super.provider);

  @override
  String get customizedText =>
      (origin as AutoDisposeFamilyProvider).customizedText;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
