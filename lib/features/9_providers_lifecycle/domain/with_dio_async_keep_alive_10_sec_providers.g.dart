// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'with_dio_async_keep_alive_10_sec_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsListThatCashedFor10SecHash() =>
    r'c2997a67c8c6ffea11c13a8883cf523ce3a03756';

/// See also [getProductsListThatCashedFor10Sec].
@ProviderFor(getProductsListThatCashedFor10Sec)
final getProductsListThatCashedFor10SecProvider =
    AutoDisposeFutureProvider<List<Product>>.internal(
      getProductsListThatCashedFor10Sec,
      name: r'getProductsListThatCashedFor10SecProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$getProductsListThatCashedFor10SecHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProductsListThatCashedFor10SecRef =
    AutoDisposeFutureProviderRef<List<Product>>;
String _$getProductDetailsThatCashedFor25SecHash() =>
    r'cf84b77b184664ef8f306d410cecc6fd7fbea54a';

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

/// See also [getProductDetailsThatCashedFor25Sec].
@ProviderFor(getProductDetailsThatCashedFor25Sec)
const getProductDetailsThatCashedFor25SecProvider =
    GetProductDetailsThatCashedFor25SecFamily();

/// See also [getProductDetailsThatCashedFor25Sec].
class GetProductDetailsThatCashedFor25SecFamily
    extends Family<AsyncValue<Product>> {
  /// See also [getProductDetailsThatCashedFor25Sec].
  const GetProductDetailsThatCashedFor25SecFamily();

  /// See also [getProductDetailsThatCashedFor25Sec].
  GetProductDetailsThatCashedFor25SecProvider call({required int productId}) {
    return GetProductDetailsThatCashedFor25SecProvider(productId: productId);
  }

  @override
  GetProductDetailsThatCashedFor25SecProvider getProviderOverride(
    covariant GetProductDetailsThatCashedFor25SecProvider provider,
  ) {
    return call(productId: provider.productId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getProductDetailsThatCashedFor25SecProvider';
}

/// See also [getProductDetailsThatCashedFor25Sec].
class GetProductDetailsThatCashedFor25SecProvider
    extends AutoDisposeFutureProvider<Product> {
  /// See also [getProductDetailsThatCashedFor25Sec].
  GetProductDetailsThatCashedFor25SecProvider({required int productId})
    : this._internal(
        (ref) => getProductDetailsThatCashedFor25Sec(
          ref as GetProductDetailsThatCashedFor25SecRef,
          productId: productId,
        ),
        from: getProductDetailsThatCashedFor25SecProvider,
        name: r'getProductDetailsThatCashedFor25SecProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getProductDetailsThatCashedFor25SecHash,
        dependencies: GetProductDetailsThatCashedFor25SecFamily._dependencies,
        allTransitiveDependencies:
            GetProductDetailsThatCashedFor25SecFamily
                ._allTransitiveDependencies,
        productId: productId,
      );

  GetProductDetailsThatCashedFor25SecProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final int productId;

  @override
  Override overrideWith(
    FutureOr<Product> Function(GetProductDetailsThatCashedFor25SecRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductDetailsThatCashedFor25SecProvider._internal(
        (ref) => create(ref as GetProductDetailsThatCashedFor25SecRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product> createElement() {
    return _GetProductDetailsThatCashedFor25SecProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductDetailsThatCashedFor25SecProvider &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetProductDetailsThatCashedFor25SecRef
    on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `productId` of this provider.
  int get productId;
}

class _GetProductDetailsThatCashedFor25SecProviderElement
    extends AutoDisposeFutureProviderElement<Product>
    with GetProductDetailsThatCashedFor25SecRef {
  _GetProductDetailsThatCashedFor25SecProviderElement(super.provider);

  @override
  int get productId =>
      (origin as GetProductDetailsThatCashedFor25SecProvider).productId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
