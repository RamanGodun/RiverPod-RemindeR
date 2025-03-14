// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_with_family_mod_gen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$simpleProviderWithFamilyModGenHash() =>
    r'93d54264c9f61af2d7282d4acb89c046dbd8bed6';

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

/// See also [simpleProviderWithFamilyModGen].
@ProviderFor(simpleProviderWithFamilyModGen)
const simpleProviderWithFamilyModGenProvider =
    SimpleProviderWithFamilyModGenFamily();

/// See also [simpleProviderWithFamilyModGen].
class SimpleProviderWithFamilyModGenFamily extends Family<String> {
  /// See also [simpleProviderWithFamilyModGen].
  const SimpleProviderWithFamilyModGenFamily();

  /// See also [simpleProviderWithFamilyModGen].
  SimpleProviderWithFamilyModGenProvider call({required String customName}) {
    return SimpleProviderWithFamilyModGenProvider(customName: customName);
  }

  @override
  SimpleProviderWithFamilyModGenProvider getProviderOverride(
    covariant SimpleProviderWithFamilyModGenProvider provider,
  ) {
    return call(customName: provider.customName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'simpleProviderWithFamilyModGenProvider';
}

/// See also [simpleProviderWithFamilyModGen].
class SimpleProviderWithFamilyModGenProvider extends Provider<String> {
  /// See also [simpleProviderWithFamilyModGen].
  SimpleProviderWithFamilyModGenProvider({required String customName})
    : this._internal(
        (ref) => simpleProviderWithFamilyModGen(
          ref as SimpleProviderWithFamilyModGenRef,
          customName: customName,
        ),
        from: simpleProviderWithFamilyModGenProvider,
        name: r'simpleProviderWithFamilyModGenProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$simpleProviderWithFamilyModGenHash,
        dependencies: SimpleProviderWithFamilyModGenFamily._dependencies,
        allTransitiveDependencies:
            SimpleProviderWithFamilyModGenFamily._allTransitiveDependencies,
        customName: customName,
      );

  SimpleProviderWithFamilyModGenProvider._internal(
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
    String Function(SimpleProviderWithFamilyModGenRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SimpleProviderWithFamilyModGenProvider._internal(
        (ref) => create(ref as SimpleProviderWithFamilyModGenRef),
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
  ProviderElement<String> createElement() {
    return _SimpleProviderWithFamilyModGenProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SimpleProviderWithFamilyModGenProvider &&
        other.customName == customName;
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
mixin SimpleProviderWithFamilyModGenRef on ProviderRef<String> {
  /// The parameter `customName` of this provider.
  String get customName;
}

class _SimpleProviderWithFamilyModGenProviderElement
    extends ProviderElement<String>
    with SimpleProviderWithFamilyModGenRef {
  _SimpleProviderWithFamilyModGenProviderElement(super.provider);

  @override
  String get customName =>
      (origin as SimpleProviderWithFamilyModGenProvider).customName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
