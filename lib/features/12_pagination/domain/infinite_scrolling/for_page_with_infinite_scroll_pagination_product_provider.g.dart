// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'for_page_with_infinite_scroll_pagination_product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$forPageWithInfiniteScrollPaginationGetProductHash() =>
    r'e679a1197e8bbb254326d709bed077f6b914694a';

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

/// See also [forPageWithInfiniteScrollPaginationGetProduct].
@ProviderFor(forPageWithInfiniteScrollPaginationGetProduct)
const forPageWithInfiniteScrollPaginationGetProductProvider =
    ForPageWithInfiniteScrollPaginationGetProductFamily();

/// See also [forPageWithInfiniteScrollPaginationGetProduct].
class ForPageWithInfiniteScrollPaginationGetProductFamily
    extends Family<AsyncValue<Product>> {
  /// See also [forPageWithInfiniteScrollPaginationGetProduct].
  const ForPageWithInfiniteScrollPaginationGetProductFamily();

  /// See also [forPageWithInfiniteScrollPaginationGetProduct].
  ForPageWithInfiniteScrollPaginationGetProductProvider call(
    int id,
  ) {
    return ForPageWithInfiniteScrollPaginationGetProductProvider(
      id,
    );
  }

  @override
  ForPageWithInfiniteScrollPaginationGetProductProvider getProviderOverride(
    covariant ForPageWithInfiniteScrollPaginationGetProductProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'forPageWithInfiniteScrollPaginationGetProductProvider';
}

/// See also [forPageWithInfiniteScrollPaginationGetProduct].
class ForPageWithInfiniteScrollPaginationGetProductProvider
    extends AutoDisposeFutureProvider<Product> {
  /// See also [forPageWithInfiniteScrollPaginationGetProduct].
  ForPageWithInfiniteScrollPaginationGetProductProvider(
    int id,
  ) : this._internal(
          (ref) => forPageWithInfiniteScrollPaginationGetProduct(
            ref as ForPageWithInfiniteScrollPaginationGetProductRef,
            id,
          ),
          from: forPageWithInfiniteScrollPaginationGetProductProvider,
          name: r'forPageWithInfiniteScrollPaginationGetProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forPageWithInfiniteScrollPaginationGetProductHash,
          dependencies:
              ForPageWithInfiniteScrollPaginationGetProductFamily._dependencies,
          allTransitiveDependencies:
              ForPageWithInfiniteScrollPaginationGetProductFamily
                  ._allTransitiveDependencies,
          id: id,
        );

  ForPageWithInfiniteScrollPaginationGetProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Product> Function(
            ForPageWithInfiniteScrollPaginationGetProductRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForPageWithInfiniteScrollPaginationGetProductProvider._internal(
        (ref) =>
            create(ref as ForPageWithInfiniteScrollPaginationGetProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product> createElement() {
    return _ForPageWithInfiniteScrollPaginationGetProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForPageWithInfiniteScrollPaginationGetProductProvider &&
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ForPageWithInfiniteScrollPaginationGetProductRef
    on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ForPageWithInfiniteScrollPaginationGetProductProviderElement
    extends AutoDisposeFutureProviderElement<Product>
    with ForPageWithInfiniteScrollPaginationGetProductRef {
  _ForPageWithInfiniteScrollPaginationGetProductProviderElement(super.provider);

  @override
  int get id =>
      (origin as ForPageWithInfiniteScrollPaginationGetProductProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
