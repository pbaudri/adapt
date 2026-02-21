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
import 'package:serverpod/serverpod.dart' as _i1;
import '../auth/email_idp_endpoint.dart' as _i2;
import '../auth/jwt_refresh_endpoint.dart' as _i3;
import '../endpoints/auth_endpoint.dart' as _i4;
import '../endpoints/drink_endpoint.dart' as _i5;
import '../endpoints/history_endpoint.dart' as _i6;
import '../endpoints/home_endpoint.dart' as _i7;
import '../endpoints/meal_endpoint.dart' as _i8;
import '../endpoints/onboarding_endpoint.dart' as _i9;
import '../endpoints/profile_endpoint.dart' as _i10;
import '../endpoints/recap_endpoint.dart' as _i11;
import '../greetings/greeting_endpoint.dart' as _i12;
import 'dart:typed_data' as _i13;
import 'package:adapt_server/src/generated/meal_correction_input.dart' as _i14;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i15;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i16;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'emailIdp': _i2.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i3.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'auth': _i4.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'drink': _i5.DrinkEndpoint()
        ..initialize(
          server,
          'drink',
          null,
        ),
      'history': _i6.HistoryEndpoint()
        ..initialize(
          server,
          'history',
          null,
        ),
      'home': _i7.HomeEndpoint()
        ..initialize(
          server,
          'home',
          null,
        ),
      'meal': _i8.MealEndpoint()
        ..initialize(
          server,
          'meal',
          null,
        ),
      'onboarding': _i9.OnboardingEndpoint()
        ..initialize(
          server,
          'onboarding',
          null,
        ),
      'profile': _i10.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'recap': _i11.RecapEndpoint()
        ..initialize(
          server,
          'recap',
          null,
        ),
      'greeting': _i12.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i3.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'continueAsGuest': _i1.MethodConnector(
          name: 'continueAsGuest',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i4.AuthEndpoint)
                  .continueAsGuest(session),
        ),
        'ensureProfile': _i1.MethodConnector(
          name: 'ensureProfile',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i4.AuthEndpoint).ensureProfile(
                session,
              ),
        ),
      },
    );
    connectors['drink'] = _i1.EndpointConnector(
      name: 'drink',
      endpoint: endpoints['drink']!,
      methodConnectors: {
        'getDrinkReference': _i1.MethodConnector(
          name: 'getDrinkReference',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['drink'] as _i5.DrinkEndpoint)
                  .getDrinkReference(session),
        ),
        'logDrinks': _i1.MethodConnector(
          name: 'logDrinks',
          params: {
            'drinkType': _i1.ParameterDescription(
              name: 'drinkType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['drink'] as _i5.DrinkEndpoint).logDrinks(
                session,
                params['drinkType'],
                params['quantity'],
              ),
        ),
        'getTodayDrinks': _i1.MethodConnector(
          name: 'getTodayDrinks',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['drink'] as _i5.DrinkEndpoint)
                  .getTodayDrinks(session),
        ),
      },
    );
    connectors['history'] = _i1.EndpointConnector(
      name: 'history',
      endpoint: endpoints['history']!,
      methodConnectors: {
        'getWeekSummary': _i1.MethodConnector(
          name: 'getWeekSummary',
          params: {
            'weekStartDate': _i1.ParameterDescription(
              name: 'weekStartDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['history'] as _i6.HistoryEndpoint).getWeekSummary(
                    session,
                    params['weekStartDate'],
                  ),
        ),
        'getDayDetail': _i1.MethodConnector(
          name: 'getDayDetail',
          params: {
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['history'] as _i6.HistoryEndpoint).getDayDetail(
                    session,
                    params['date'],
                  ),
        ),
      },
    );
    connectors['home'] = _i1.EndpointConnector(
      name: 'home',
      endpoint: endpoints['home']!,
      methodConnectors: {
        'getHomeData': _i1.MethodConnector(
          name: 'getHomeData',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['home'] as _i7.HomeEndpoint).getHomeData(session),
        ),
      },
    );
    connectors['meal'] = _i1.EndpointConnector(
      name: 'meal',
      endpoint: endpoints['meal']!,
      methodConnectors: {
        'logMealByText': _i1.MethodConnector(
          name: 'logMealByText',
          params: {
            'text': _i1.ParameterDescription(
              name: 'text',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meal'] as _i8.MealEndpoint).logMealByText(
                session,
                params['text'],
              ),
        ),
        'logMealByPhoto': _i1.MethodConnector(
          name: 'logMealByPhoto',
          params: {
            'imageBytes': _i1.ParameterDescription(
              name: 'imageBytes',
              type: _i1.getType<_i13.ByteData>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meal'] as _i8.MealEndpoint).logMealByPhoto(
                session,
                params['imageBytes'],
              ),
        ),
        'confirmMeal': _i1.MethodConnector(
          name: 'confirmMeal',
          params: {
            'mealLogId': _i1.ParameterDescription(
              name: 'mealLogId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meal'] as _i8.MealEndpoint).confirmMeal(
                session,
                params['mealLogId'],
              ),
        ),
        'correctMeal': _i1.MethodConnector(
          name: 'correctMeal',
          params: {
            'mealLogId': _i1.ParameterDescription(
              name: 'mealLogId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'correctedData': _i1.ParameterDescription(
              name: 'correctedData',
              type: _i1.getType<_i14.MealCorrectionInput>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meal'] as _i8.MealEndpoint).correctMeal(
                session,
                params['mealLogId'],
                params['correctedData'],
              ),
        ),
        'getTodayMeals': _i1.MethodConnector(
          name: 'getTodayMeals',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['meal'] as _i8.MealEndpoint).getTodayMeals(
                session,
              ),
        ),
      },
    );
    connectors['onboarding'] = _i1.EndpointConnector(
      name: 'onboarding',
      endpoint: endpoints['onboarding']!,
      methodConnectors: {
        'saveName': _i1.MethodConnector(
          name: 'saveName',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['onboarding'] as _i9.OnboardingEndpoint).saveName(
                    session,
                    params['name'],
                  ),
        ),
        'saveEatingStyle': _i1.MethodConnector(
          name: 'saveEatingStyle',
          params: {
            'style': _i1.ParameterDescription(
              name: 'style',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['onboarding'] as _i9.OnboardingEndpoint)
                  .saveEatingStyle(
                    session,
                    params['style'],
                  ),
        ),
        'saveGoal': _i1.MethodConnector(
          name: 'saveGoal',
          params: {
            'goal': _i1.ParameterDescription(
              name: 'goal',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['onboarding'] as _i9.OnboardingEndpoint).saveGoal(
                    session,
                    params['goal'],
                  ),
        ),
        'saveAlcoholHabit': _i1.MethodConnector(
          name: 'saveAlcoholHabit',
          params: {
            'habit': _i1.ParameterDescription(
              name: 'habit',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['onboarding'] as _i9.OnboardingEndpoint)
                  .saveAlcoholHabit(
                    session,
                    params['habit'],
                  ),
        ),
        'savePersonalInfo': _i1.MethodConnector(
          name: 'savePersonalInfo',
          params: {
            'age': _i1.ParameterDescription(
              name: 'age',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'biologicalSex': _i1.ParameterDescription(
              name: 'biologicalSex',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'weightKg': _i1.ParameterDescription(
              name: 'weightKg',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'heightCm': _i1.ParameterDescription(
              name: 'heightCm',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['onboarding'] as _i9.OnboardingEndpoint)
                  .savePersonalInfo(
                    session,
                    params['age'],
                    params['biologicalSex'],
                    params['weightKg'],
                    params['heightCm'],
                  ),
        ),
      },
    );
    connectors['profile'] = _i1.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'getProfile': _i1.MethodConnector(
          name: 'getProfile',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i10.ProfileEndpoint)
                  .getProfile(session),
        ),
        'updateWeight': _i1.MethodConnector(
          name: 'updateWeight',
          params: {
            'weightKg': _i1.ParameterDescription(
              name: 'weightKg',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['profile'] as _i10.ProfileEndpoint).updateWeight(
                    session,
                    params['weightKg'],
                  ),
        ),
        'updateHeight': _i1.MethodConnector(
          name: 'updateHeight',
          params: {
            'heightCm': _i1.ParameterDescription(
              name: 'heightCm',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['profile'] as _i10.ProfileEndpoint).updateHeight(
                    session,
                    params['heightCm'],
                  ),
        ),
        'updateAge': _i1.MethodConnector(
          name: 'updateAge',
          params: {
            'age': _i1.ParameterDescription(
              name: 'age',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['profile'] as _i10.ProfileEndpoint).updateAge(
                    session,
                    params['age'],
                  ),
        ),
        'updateGoal': _i1.MethodConnector(
          name: 'updateGoal',
          params: {
            'goal': _i1.ParameterDescription(
              name: 'goal',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['profile'] as _i10.ProfileEndpoint).updateGoal(
                    session,
                    params['goal'],
                  ),
        ),
        'updateWeightUnit': _i1.MethodConnector(
          name: 'updateWeightUnit',
          params: {
            'unit': _i1.ParameterDescription(
              name: 'unit',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i10.ProfileEndpoint)
                  .updateWeightUnit(
                    session,
                    params['unit'],
                  ),
        ),
        'updateHeightUnit': _i1.MethodConnector(
          name: 'updateHeightUnit',
          params: {
            'unit': _i1.ParameterDescription(
              name: 'unit',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i10.ProfileEndpoint)
                  .updateHeightUnit(
                    session,
                    params['unit'],
                  ),
        ),
        'updatePreferences': _i1.MethodConnector(
          name: 'updatePreferences',
          params: {
            'alcoholTracking': _i1.ParameterDescription(
              name: 'alcoholTracking',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'morningRecap': _i1.ParameterDescription(
              name: 'morningRecap',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i10.ProfileEndpoint)
                  .updatePreferences(
                    session,
                    params['alcoholTracking'],
                    params['morningRecap'],
                  ),
        ),
        'deleteAllData': _i1.MethodConnector(
          name: 'deleteAllData',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i10.ProfileEndpoint)
                  .deleteAllData(session),
        ),
      },
    );
    connectors['recap'] = _i1.EndpointConnector(
      name: 'recap',
      endpoint: endpoints['recap']!,
      methodConnectors: {
        'getMorningRecap': _i1.MethodConnector(
          name: 'getMorningRecap',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['recap'] as _i11.RecapEndpoint)
                  .getMorningRecap(session),
        ),
        'markRecapSeen': _i1.MethodConnector(
          name: 'markRecapSeen',
          params: {
            'recapId': _i1.ParameterDescription(
              name: 'recapId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['recap'] as _i11.RecapEndpoint).markRecapSeen(
                    session,
                    params['recapId'],
                  ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i12.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i15.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i16.Endpoints()
      ..initializeEndpoints(server);
  }
}
