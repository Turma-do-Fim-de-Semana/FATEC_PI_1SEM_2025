// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$professionalsHash() => r'943aa50552e7a37c469e9b806e241b3139d942f8';

/// See also [professionals].
@ProviderFor(professionals)
final professionalsProvider =
    AutoDisposeFutureProvider<List<ProfessionalModel>>.internal(
      professionals,
      name: r'professionalsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$professionalsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfessionalsRef =
    AutoDisposeFutureProviderRef<List<ProfessionalModel>>;
String _$professionalsByCategoryHash() =>
    r'80496223712db77a5a1d070eff2a9371fc3fd168';

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

/// See also [professionalsByCategory].
@ProviderFor(professionalsByCategory)
const professionalsByCategoryProvider = ProfessionalsByCategoryFamily();

/// See also [professionalsByCategory].
class ProfessionalsByCategoryFamily
    extends Family<AsyncValue<List<ProfessionalModel>>> {
  /// See also [professionalsByCategory].
  const ProfessionalsByCategoryFamily();

  /// See also [professionalsByCategory].
  ProfessionalsByCategoryProvider call(String categoryId) {
    return ProfessionalsByCategoryProvider(categoryId);
  }

  @override
  ProfessionalsByCategoryProvider getProviderOverride(
    covariant ProfessionalsByCategoryProvider provider,
  ) {
    return call(provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'professionalsByCategoryProvider';
}

/// See also [professionalsByCategory].
class ProfessionalsByCategoryProvider
    extends AutoDisposeFutureProvider<List<ProfessionalModel>> {
  /// See also [professionalsByCategory].
  ProfessionalsByCategoryProvider(String categoryId)
    : this._internal(
        (ref) => professionalsByCategory(
          ref as ProfessionalsByCategoryRef,
          categoryId,
        ),
        from: professionalsByCategoryProvider,
        name: r'professionalsByCategoryProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$professionalsByCategoryHash,
        dependencies: ProfessionalsByCategoryFamily._dependencies,
        allTransitiveDependencies:
            ProfessionalsByCategoryFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  ProfessionalsByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String categoryId;

  @override
  Override overrideWith(
    FutureOr<List<ProfessionalModel>> Function(
      ProfessionalsByCategoryRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProfessionalsByCategoryProvider._internal(
        (ref) => create(ref as ProfessionalsByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProfessionalModel>> createElement() {
    return _ProfessionalsByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfessionalsByCategoryProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProfessionalsByCategoryRef
    on AutoDisposeFutureProviderRef<List<ProfessionalModel>> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _ProfessionalsByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<ProfessionalModel>>
    with ProfessionalsByCategoryRef {
  _ProfessionalsByCategoryProviderElement(super.provider);

  @override
  String get categoryId =>
      (origin as ProfessionalsByCategoryProvider).categoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
