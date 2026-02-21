/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// Authentication token returned after sign-in, sign-up, or guest session creation.
abstract class AuthToken implements _i1.SerializableModel {
  AuthToken._({
    required this.key,
    required this.userId,
    required this.isGuest,
  });

  factory AuthToken({
    required String key,
    required String userId,
    required bool isGuest,
  }) = _AuthTokenImpl;

  factory AuthToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthToken(
      key: jsonSerialization['key'] as String,
      userId: jsonSerialization['userId'] as String,
      isGuest: jsonSerialization['isGuest'] as bool,
    );
  }

  /// Serverpod session key for authenticating subsequent requests.
  String key;

  /// The authenticated user's UUID string.
  String userId;

  /// True when this is a guest session (no account created).
  bool isGuest;

  /// Returns a shallow copy of this [AuthToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthToken copyWith({
    String? key,
    String? userId,
    bool? isGuest,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthToken',
      'key': key,
      'userId': userId,
      'isGuest': isGuest,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AuthTokenImpl extends AuthToken {
  _AuthTokenImpl({
    required String key,
    required String userId,
    required bool isGuest,
  }) : super._(
         key: key,
         userId: userId,
         isGuest: isGuest,
       );

  /// Returns a shallow copy of this [AuthToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthToken copyWith({
    String? key,
    String? userId,
    bool? isGuest,
  }) {
    return AuthToken(
      key: key ?? this.key,
      userId: userId ?? this.userId,
      isGuest: isGuest ?? this.isGuest,
    );
  }
}
