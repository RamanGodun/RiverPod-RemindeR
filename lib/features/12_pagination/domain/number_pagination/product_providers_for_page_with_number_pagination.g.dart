// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers_for_page_with_number_pagination.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$forPageWithNumberPaginationGetProductHash() =>
    r'5af982292000a3274a5cb6c5be8fb21d3805be00';

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

/// See also [forPageWithNumberPaginationGetProduct].
@ProviderFor(forPageWithNumberPaginationGetProduct)
const forPageWithNumberPaginationGetProductProvider =
    ForPageWithNumberPaginationGetProductFamily();

/// See also [forPageWithNumberPaginationGetProduct].
class ForPageWithNumberPaginationGetProductFamily
    extends Family<AsyncValue<Product>> {
  /// See also [forPageWithNumberPaginationGetProduct].
  const ForPageWithNumberPaginationGetProductFamily();

  /// See also [forPageWithNumberPaginationGetProduct].
  ForPageWithNumberPaginationGetProductProvider call(int id) {
    return ForPageWithNumberPaginationGetProductProvider(id);
  }

  @override
  ForPageWithNumberPaginationGetProductProvider getProviderOverride(
    covariant ForPageWithNumberPaginationGetProductProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'forPageWithNumberPaginationGetProductProvider';
}

/// See also [forPageWithNumberPaginationGetProduct].
class ForPageWithNumberPaginationGetProductProvider
    extends AutoDisposeFutureProvider<Product> {
  /// See also [forPageWithNumberPaginationGetProduct].
  ForPageWithNumberPaginationGetProductProvider(int id)
    : this._internal(
        (ref) => forPageWithNumberPaginationGetProduct(
          ref as ForPageWithNumberPaginationGetProductRef,
          id,
        ),
        from: forPageWithNumberPaginationGetProductProvider,
        name: r'forPageWithNumberPaginationGetProductProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$forPageWithNumberPaginationGetProductHash,
        dependencies: ForPageWithNumberPaginationGetProductFamily._dependencies,
        allTransitiveDependencies:
            ForPageWithNumberPaginationGetProductFamily
                ._allTransitiveDependencies,
        id: id,
      );

  ForPageWithNumberPaginationGetProductProvider._internal(
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
      ForPageWithNumberPaginationGetProductRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForPageWithNumberPaginationGetProductProvider._internal(
        (ref) => create(ref as ForPageWithNumberPaginationGetProductRef),
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
    return _ForPageWithNumberPaginationGetProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForPageWithNumberPaginationGetProductProvider &&
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
mixin ForPageWithNumberPaginationGetProductRef
    on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ForPageWithNumberPaginationGetProductProviderElement
    extends AutoDisposeFutureProviderElement<Product>
    with ForPageWithNumberPaginationGetProductRef {
  _ForPageWithNumberPaginationGetProductProviderElement(super.provider);

  @override
  int get id => (origin as ForPageWithNumberPaginationGetProductProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
