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
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import 'dart:async' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import 'package:adapt_client/src/protocol/auth_token.dart' as _i5;
import 'package:adapt_client/src/protocol/drink_reference.dart' as _i6;
import 'package:adapt_client/src/protocol/daily_summary.dart' as _i7;
import 'package:adapt_client/src/protocol/drink_log.dart' as _i8;
import 'package:adapt_client/src/protocol/day_detail.dart' as _i9;
import 'package:adapt_client/src/protocol/home_data.dart' as _i10;
import 'package:adapt_client/src/protocol/meal_result.dart' as _i11;
import 'dart:typed_data' as _i12;
import 'package:adapt_client/src/protocol/meal_correction_input.dart' as _i13;
import 'package:adapt_client/src/protocol/meal_log.dart' as _i14;
import 'package:adapt_client/src/protocol/user_profile.dart' as _i15;
import 'package:adapt_client/src/protocol/morning_recap.dart' as _i16;
import 'package:adapt_client/src/protocol/greetings/greeting.dart' as _i17;
import 'protocol.dart' as _i18;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i1.EndpointEmailIdpBase {
  EndpointEmailIdp(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<_i4.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i3.Future<_i2.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i3.Future<String> verifyRegistrationCode({
    required _i2.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i3.Future<_i4.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i3.Future<_i2.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i3.Future<String> verifyPasswordResetCode({
    required _i2.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _i3.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i4.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i3.Future<_i4.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// Handles guest session creation.
///
/// Email sign-in and sign-up are handled by the built-in EmailIdpEndpoint
/// (lib/src/auth/email_idp_endpoint.dart). This endpoint creates user profiles
/// for newly authenticated users and provides guest-mode access.
/// {@category Endpoint}
class EndpointAuth extends _i2.EndpointRef {
  EndpointAuth(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// Creates a guest-mode user profile and returns a placeholder token.
  ///
  /// The client stores the returned key locally (via sqflite) for offline-first
  /// guest usage. Guest data is not synced until the user signs in.
  _i3.Future<_i5.AuthToken> continueAsGuest() =>
      caller.callServerEndpoint<_i5.AuthToken>(
        'auth',
        'continueAsGuest',
        {},
      );

  /// Ensures a UserProfile exists for the authenticated user.
  ///
  /// Called by the client after a successful sign-in or sign-up via
  /// the email IDP flow. Creates a default profile on first sign-in.
  _i3.Future<_i5.AuthToken> ensureProfile() =>
      caller.callServerEndpoint<_i5.AuthToken>(
        'auth',
        'ensureProfile',
        {},
      );
}

/// Handles drink reference lookups and drink logging.
/// {@category Endpoint}
class EndpointDrink extends _i2.EndpointRef {
  EndpointDrink(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'drink';

  /// Returns the full list of drink reference items (static seed data).
  _i3.Future<List<_i6.DrinkReference>> getDrinkReference() =>
      caller.callServerEndpoint<List<_i6.DrinkReference>>(
        'drink',
        'getDrinkReference',
        {},
      );

  /// Logs a drink for the authenticated user and returns the updated summary.
  _i3.Future<_i7.DailySummary> logDrinks(
    String drinkType,
    int quantity,
  ) => caller.callServerEndpoint<_i7.DailySummary>(
    'drink',
    'logDrinks',
    {
      'drinkType': drinkType,
      'quantity': quantity,
    },
  );

  /// Returns today's drink logs for the authenticated user.
  _i3.Future<List<_i8.DrinkLog>> getTodayDrinks() =>
      caller.callServerEndpoint<List<_i8.DrinkLog>>(
        'drink',
        'getTodayDrinks',
        {},
      );
}

/// Provides historical nutrition data: weekly summaries and day details.
/// {@category Endpoint}
class EndpointHistory extends _i2.EndpointRef {
  EndpointHistory(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'history';

  /// Returns the seven DailySummary rows starting at [weekStartDate].
  _i3.Future<List<_i7.DailySummary>> getWeekSummary(DateTime weekStartDate) =>
      caller.callServerEndpoint<List<_i7.DailySummary>>(
        'history',
        'getWeekSummary',
        {'weekStartDate': weekStartDate},
      );

  /// Returns the full detail for a single day: summary + meals + drinks.
  _i3.Future<_i9.DayDetail> getDayDetail(DateTime date) =>
      caller.callServerEndpoint<_i9.DayDetail>(
        'history',
        'getDayDetail',
        {'date': date},
      );
}

/// Provides the aggregated home screen data.
/// {@category Endpoint}
class EndpointHome extends _i2.EndpointRef {
  EndpointHome(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'home';

  _i3.Future<_i10.HomeData> getHomeData() =>
      caller.callServerEndpoint<_i10.HomeData>(
        'home',
        'getHomeData',
        {},
      );
}

/// Handles meal logging, analysis, confirmation, and correction.
/// {@category Endpoint}
class EndpointMeal extends _i2.EndpointRef {
  EndpointMeal(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'meal';

  /// Analyses free-text input and returns a MealResult (not yet confirmed).
  _i3.Future<_i11.MealResult> logMealByText(String text) =>
      caller.callServerEndpoint<_i11.MealResult>(
        'meal',
        'logMealByText',
        {'text': text},
      );

  /// Analyses a photo (bytes) and returns a MealResult (not yet confirmed).
  _i3.Future<_i11.MealResult> logMealByPhoto(_i12.ByteData imageBytes) =>
      caller.callServerEndpoint<_i11.MealResult>(
        'meal',
        'logMealByPhoto',
        {'imageBytes': imageBytes},
      );

  /// Confirms a meal: marks it as not estimated and updates the daily summary.
  _i3.Future<_i7.DailySummary> confirmMeal(int mealLogId) =>
      caller.callServerEndpoint<_i7.DailySummary>(
        'meal',
        'confirmMeal',
        {'mealLogId': mealLogId},
      );

  /// Corrects macros for a meal. caloriesKcal is always recalculated.
  _i3.Future<_i11.MealResult> correctMeal(
    int mealLogId,
    _i13.MealCorrectionInput correctedData,
  ) => caller.callServerEndpoint<_i11.MealResult>(
    'meal',
    'correctMeal',
    {
      'mealLogId': mealLogId,
      'correctedData': correctedData,
    },
  );

  /// Returns today's meal logs for the authenticated user.
  _i3.Future<List<_i14.MealLog>> getTodayMeals() =>
      caller.callServerEndpoint<List<_i14.MealLog>>(
        'meal',
        'getTodayMeals',
        {},
      );
}

/// Saves onboarding step data to the user's profile.
///
/// Each method corresponds to one onboarding screen. All writes go to
/// user_profiles and keep units in SI (kg, cm).
/// {@category Endpoint}
class EndpointOnboarding extends _i2.EndpointRef {
  EndpointOnboarding(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'onboarding';

  _i3.Future<void> saveName(String name) => caller.callServerEndpoint<void>(
    'onboarding',
    'saveName',
    {'name': name},
  );

  _i3.Future<void> saveEatingStyle(String style) =>
      caller.callServerEndpoint<void>(
        'onboarding',
        'saveEatingStyle',
        {'style': style},
      );

  _i3.Future<void> saveGoal(String goal) => caller.callServerEndpoint<void>(
    'onboarding',
    'saveGoal',
    {'goal': goal},
  );

  _i3.Future<void> saveAlcoholHabit(String habit) =>
      caller.callServerEndpoint<void>(
        'onboarding',
        'saveAlcoholHabit',
        {'habit': habit},
      );

  /// Saves personal info. All values must already be in SI units.
  ///
  /// [weightKg] — weight in kg (conversion happens on client, never here).
  /// [heightCm] — height in cm (conversion happens on client, never here).
  _i3.Future<void> savePersonalInfo(
    int age,
    String biologicalSex,
    double weightKg,
    double heightCm,
  ) => caller.callServerEndpoint<void>(
    'onboarding',
    'savePersonalInfo',
    {
      'age': age,
      'biologicalSex': biologicalSex,
      'weightKg': weightKg,
      'heightCm': heightCm,
    },
  );
}

/// Manages the user's profile — reads and per-field updates.
/// {@category Endpoint}
class EndpointProfile extends _i2.EndpointRef {
  EndpointProfile(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'profile';

  _i3.Future<_i15.UserProfile> getProfile() =>
      caller.callServerEndpoint<_i15.UserProfile>(
        'profile',
        'getProfile',
        {},
      );

  _i3.Future<_i15.UserProfile> updateWeight(double weightKg) =>
      caller.callServerEndpoint<_i15.UserProfile>(
        'profile',
        'updateWeight',
        {'weightKg': weightKg},
      );

  _i3.Future<_i15.UserProfile> updateHeight(double heightCm) =>
      caller.callServerEndpoint<_i15.UserProfile>(
        'profile',
        'updateHeight',
        {'heightCm': heightCm},
      );

  _i3.Future<_i15.UserProfile> updateAge(int age) =>
      caller.callServerEndpoint<_i15.UserProfile>(
        'profile',
        'updateAge',
        {'age': age},
      );

  _i3.Future<_i15.UserProfile> updateGoal(String goal) =>
      caller.callServerEndpoint<_i15.UserProfile>(
        'profile',
        'updateGoal',
        {'goal': goal},
      );

  _i3.Future<_i15.UserProfile> updateWeightUnit(String unit) =>
      caller.callServerEndpoint<_i15.UserProfile>(
        'profile',
        'updateWeightUnit',
        {'unit': unit},
      );

  _i3.Future<_i15.UserProfile> updateHeightUnit(String unit) =>
      caller.callServerEndpoint<_i15.UserProfile>(
        'profile',
        'updateHeightUnit',
        {'unit': unit},
      );

  _i3.Future<_i15.UserProfile> updatePreferences(
    bool alcoholTracking,
    bool morningRecap,
  ) => caller.callServerEndpoint<_i15.UserProfile>(
    'profile',
    'updatePreferences',
    {
      'alcoholTracking': alcoholTracking,
      'morningRecap': morningRecap,
    },
  );

  /// Deletes all user-generated data. Profile itself is retained.
  _i3.Future<void> deleteAllData() => caller.callServerEndpoint<void>(
    'profile',
    'deleteAllData',
    {},
  );
}

/// Provides morning recap data for the authenticated user.
/// {@category Endpoint}
class EndpointRecap extends _i2.EndpointRef {
  EndpointRecap(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'recap';

  /// Returns today's morning recap, generating one if needed.
  ///
  /// Returns `null` if there is no data for yesterday (first day of use).
  _i3.Future<_i16.MorningRecap?> getMorningRecap() =>
      caller.callServerEndpoint<_i16.MorningRecap?>(
        'recap',
        'getMorningRecap',
        {},
      );

  /// Marks a recap as seen by the user.
  _i3.Future<void> markRecapSeen(int recapId) =>
      caller.callServerEndpoint<void>(
        'recap',
        'markRecapSeen',
        {'recapId': recapId},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i2.EndpointRef {
  EndpointGreeting(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i3.Future<_i17.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i17.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i1.Caller(client);
    serverpod_auth_core = _i4.Caller(client);
  }

  late final _i1.Caller serverpod_auth_idp;

  late final _i4.Caller serverpod_auth_core;
}

class Client extends _i2.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i2.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i2.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i18.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    auth = EndpointAuth(this);
    drink = EndpointDrink(this);
    history = EndpointHistory(this);
    home = EndpointHome(this);
    meal = EndpointMeal(this);
    onboarding = EndpointOnboarding(this);
    profile = EndpointProfile(this);
    recap = EndpointRecap(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointAuth auth;

  late final EndpointDrink drink;

  late final EndpointHistory history;

  late final EndpointHome home;

  late final EndpointMeal meal;

  late final EndpointOnboarding onboarding;

  late final EndpointProfile profile;

  late final EndpointRecap recap;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i2.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'auth': auth,
    'drink': drink,
    'history': history,
    'home': home,
    'meal': meal,
    'onboarding': onboarding,
    'profile': profile,
    'recap': recap,
    'greeting': greeting,
  };

  @override
  Map<String, _i2.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
