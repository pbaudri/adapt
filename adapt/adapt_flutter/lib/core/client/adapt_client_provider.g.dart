// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adapt_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adaptClientHash() => r'1acb188b8789c61d264e88155c63ddd22454abe7';

/// Singleton Serverpod client, kept alive for the app lifetime.
/// The [FlutterAuthSessionManager] is registered as the auth key provider
/// so JWTs are persisted to secure storage and attached to every request.
///
/// Copied from [adaptClient].
@ProviderFor(adaptClient)
final adaptClientProvider = Provider<Client>.internal(
  adaptClient,
  name: r'adaptClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adaptClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AdaptClientRef = ProviderRef<Client>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
