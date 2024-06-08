// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllProductsHash() => r'53c06c2d8a6ed6014f86db78ad4cc4a478994583';

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

/// See also [fetchAllProducts].
@ProviderFor(fetchAllProducts)
const fetchAllProductsProvider = FetchAllProductsFamily();

/// See also [fetchAllProducts].
class FetchAllProductsFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [fetchAllProducts].
  const FetchAllProductsFamily();

  /// See also [fetchAllProducts].
  FetchAllProductsProvider call({
    int? limit,
    int? skip,
    String? query,
  }) {
    return FetchAllProductsProvider(
      limit: limit,
      skip: skip,
      query: query,
    );
  }

  @override
  FetchAllProductsProvider getProviderOverride(
    covariant FetchAllProductsProvider provider,
  ) {
    return call(
      limit: provider.limit,
      skip: provider.skip,
      query: provider.query,
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
  String? get name => r'fetchAllProductsProvider';
}

/// See also [fetchAllProducts].
class FetchAllProductsProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [fetchAllProducts].
  FetchAllProductsProvider({
    int? limit,
    int? skip,
    String? query,
  }) : this._internal(
          (ref) => fetchAllProducts(
            ref as FetchAllProductsRef,
            limit: limit,
            skip: skip,
            query: query,
          ),
          from: fetchAllProductsProvider,
          name: r'fetchAllProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAllProductsHash,
          dependencies: FetchAllProductsFamily._dependencies,
          allTransitiveDependencies:
              FetchAllProductsFamily._allTransitiveDependencies,
          limit: limit,
          skip: skip,
          query: query,
        );

  FetchAllProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.skip,
    required this.query,
  }) : super.internal();

  final int? limit;
  final int? skip;
  final String? query;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(FetchAllProductsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAllProductsProvider._internal(
        (ref) => create(ref as FetchAllProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        skip: skip,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _FetchAllProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAllProductsProvider &&
        other.limit == limit &&
        other.skip == skip &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, skip.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchAllProductsRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `skip` of this provider.
  int? get skip;

  /// The parameter `query` of this provider.
  String? get query;
}

class _FetchAllProductsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with FetchAllProductsRef {
  _FetchAllProductsProviderElement(super.provider);

  @override
  int? get limit => (origin as FetchAllProductsProvider).limit;
  @override
  int? get skip => (origin as FetchAllProductsProvider).skip;
  @override
  String? get query => (origin as FetchAllProductsProvider).query;
}

String _$searchProductNotifierHash() =>
    r'cc78405ab359115c1fe39899bd1843728012f712';

/// See also [SearchProductNotifier].
@ProviderFor(SearchProductNotifier)
final searchProductNotifierProvider =
    AutoDisposeNotifierProvider<SearchProductNotifier, String>.internal(
  SearchProductNotifier.new,
  name: r'searchProductNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchProductNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchProductNotifier = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
