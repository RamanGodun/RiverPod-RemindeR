// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_providers_for_page_with_number_pagination.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$forPageWithNumberPaginationGetProductsHash() =>
    r'd81d2bb7c2fe35b16d88f542a8f4233109b3abfd';

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

/// See also [forPageWithNumberPaginationGetProducts].
@ProviderFor(forPageWithNumberPaginationGetProducts)
const forPageWithNumberPaginationGetProductsProvider =
    ForPageWithNumberPaginationGetProductsFamily();

/// See also [forPageWithNumberPaginationGetProducts].
class ForPageWithNumberPaginationGetProductsFamily
    extends Family<AsyncValue<List<Product>>> {
  /// See also [forPageWithNumberPaginationGetProducts].
  const ForPageWithNumberPaginationGetProductsFamily();

  /// See also [forPageWithNumberPaginationGetProducts].
  ForPageWithNumberPaginationGetProductsProvider call(int page) {
    return ForPageWithNumberPaginationGetProductsProvider(page);
  }

  @override
  ForPageWithNumberPaginationGetProductsProvider getProviderOverride(
    covariant ForPageWithNumberPaginationGetProductsProvider provider,
  ) {
    return call(provider.page);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'forPageWithNumberPaginationGetProductsProvider';
}

/// See also [forPageWithNumberPaginationGetProducts].
class ForPageWithNumberPaginationGetProductsProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [forPageWithNumberPaginationGetProducts].
  ForPageWithNumberPaginationGetProductsProvider(int page)
    : this._internal(
        (ref) => forPageWithNumberPaginationGetProducts(
          ref as ForPageWithNumberPaginationGetProductsRef,
          page,
        ),
        from: forPageWithNumberPaginationGetProductsProvider,
        name: r'forPageWithNumberPaginationGetProductsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$forPageWithNumberPaginationGetProductsHash,
        dependencies:
            ForPageWithNumberPaginationGetProductsFamily._dependencies,
        allTransitiveDependencies:
            ForPageWithNumberPaginationGetProductsFamily
                ._allTransitiveDependencies,
        page: page,
      );

  ForPageWithNumberPaginationGetProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(
      ForPageWithNumberPaginationGetProductsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForPageWithNumberPaginationGetProductsProvider._internal(
        (ref) => create(ref as ForPageWithNumberPaginationGetProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _ForPageWithNumberPaginationGetProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForPageWithNumberPaginationGetProductsProvider &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ForPageWithNumberPaginationGetProductsRef
    on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _ForPageWithNumberPaginationGetProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with ForPageWithNumberPaginationGetProductsRef {
  _ForPageWithNumberPaginationGetProductsProviderElement(super.provider);

  @override
  int get page =>
      (origin as ForPageWithNumberPaginationGetProductsProvider).page;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
