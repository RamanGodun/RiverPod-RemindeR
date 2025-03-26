// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_future_provider_gen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$withCodeGenerationUserDetailsHash() =>
    r'885648b7f1c060fbe7a4bdeebfc5d973c6e37ca8';

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

/// See also [withCodeGenerationUserDetails].
@ProviderFor(withCodeGenerationUserDetails)
const withCodeGenerationUserDetailsProvider =
    WithCodeGenerationUserDetailsFamily();

/// See also [withCodeGenerationUserDetails].
class WithCodeGenerationUserDetailsFamily extends Family<AsyncValue<User>> {
  /// See also [withCodeGenerationUserDetails].
  const WithCodeGenerationUserDetailsFamily();

  /// See also [withCodeGenerationUserDetails].
  WithCodeGenerationUserDetailsProvider call(
    int id,
  ) {
    return WithCodeGenerationUserDetailsProvider(
      id,
    );
  }

  @override
  WithCodeGenerationUserDetailsProvider getProviderOverride(
    covariant WithCodeGenerationUserDetailsProvider provider,
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
  String? get name => r'withCodeGenerationUserDetailsProvider';
}

/// See also [withCodeGenerationUserDetails].
class WithCodeGenerationUserDetailsProvider
    extends AutoDisposeFutureProvider<User> {
  /// See also [withCodeGenerationUserDetails].
  WithCodeGenerationUserDetailsProvider(
    int id,
  ) : this._internal(
          (ref) => withCodeGenerationUserDetails(
            ref as WithCodeGenerationUserDetailsRef,
            id,
          ),
          from: withCodeGenerationUserDetailsProvider,
          name: r'withCodeGenerationUserDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$withCodeGenerationUserDetailsHash,
          dependencies: WithCodeGenerationUserDetailsFamily._dependencies,
          allTransitiveDependencies:
              WithCodeGenerationUserDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  WithCodeGenerationUserDetailsProvider._internal(
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
    FutureOr<User> Function(WithCodeGenerationUserDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WithCodeGenerationUserDetailsProvider._internal(
        (ref) => create(ref as WithCodeGenerationUserDetailsRef),
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
  AutoDisposeFutureProviderElement<User> createElement() {
    return _WithCodeGenerationUserDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WithCodeGenerationUserDetailsProvider && other.id == id;
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
mixin WithCodeGenerationUserDetailsRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WithCodeGenerationUserDetailsProviderElement
    extends AutoDisposeFutureProviderElement<User>
    with WithCodeGenerationUserDetailsRef {
  _WithCodeGenerationUserDetailsProviderElement(super.provider);

  @override
  int get id => (origin as WithCodeGenerationUserDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
