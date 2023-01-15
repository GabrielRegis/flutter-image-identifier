// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_scanned_cnh.dart';

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

String _$CurrentScannedCNHStoreHash() =>
    r'4000dff28fd548072f4e3ad6bba3798a95c197b3';

/// See also [CurrentScannedCNHStore].
final currentScannedCNHStoreProvider =
    AutoDisposeAsyncNotifierProvider<CurrentScannedCNHStore, CNH?>(
  CurrentScannedCNHStore.new,
  name: r'currentScannedCNHStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$CurrentScannedCNHStoreHash,
);
typedef CurrentScannedCNHStoreRef = AutoDisposeAsyncNotifierProviderRef<CNH?>;

abstract class _$CurrentScannedCNHStore extends AutoDisposeAsyncNotifier<CNH?> {
  @override
  FutureOr<CNH?> build();
}
