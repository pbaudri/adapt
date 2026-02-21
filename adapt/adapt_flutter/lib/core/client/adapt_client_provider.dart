import 'package:adapt_client/src/protocol/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_core_flutter/serverpod_auth_core_flutter.dart';

part 'adapt_client_provider.g.dart';

/// Base URL of the Adapt server.
/// Override with your staging/production host via environment configuration.
const _serverHost = 'http://localhost:8080/';

/// Singleton Serverpod client, kept alive for the app lifetime.
/// The [FlutterAuthSessionManager] is registered as the auth key provider
/// so JWTs are persisted to secure storage and attached to every request.
@Riverpod(keepAlive: true)
Client adaptClient(AdaptClientRef ref) {
  final client = Client(_serverHost);
  client.authSessionManager = FlutterAuthSessionManager();
  return client;
}
