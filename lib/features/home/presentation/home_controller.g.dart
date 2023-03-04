// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$infoUserHash() => r'e3f4d374fdd03b90f4a476b411dc436b856448ae';

/// See also [infoUser].
final infoUserProvider = AutoDisposeFutureProvider<User>(
  infoUser,
  name: r'infoUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$infoUserHash,
);
typedef InfoUserRef = AutoDisposeFutureProviderRef<User>;
String _$picklistHash() => r'2cbc87891df3f840175de50bd053af87e15c9220';

/// See also [picklist].
class PicklistProvider extends AutoDisposeFutureProvider<List<Picklist>> {
  PicklistProvider({
    required this.picklistParams,
  }) : super(
          (ref) => picklist(
            ref,
            picklistParams: picklistParams,
          ),
          from: picklistProvider,
          name: r'picklistProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$picklistHash,
        );

  final PicklistParams picklistParams;

  @override
  bool operator ==(Object other) {
    return other is PicklistProvider && other.picklistParams == picklistParams;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, picklistParams.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef PicklistRef = AutoDisposeFutureProviderRef<List<Picklist>>;

/// See also [picklist].
final picklistProvider = PicklistFamily();

class PicklistFamily extends Family<AsyncValue<List<Picklist>>> {
  PicklistFamily();

  PicklistProvider call({
    required PicklistParams picklistParams,
  }) {
    return PicklistProvider(
      picklistParams: picklistParams,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Picklist>> getProviderOverride(
    covariant PicklistProvider provider,
  ) {
    return call(
      picklistParams: provider.picklistParams,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'picklistProvider';
}
