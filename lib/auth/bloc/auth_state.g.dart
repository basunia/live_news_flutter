// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthState _$AuthStateFromJson(Map<String, dynamic> json) => AuthState(
      account:
          json['account'] == null ? null : Account.fromJson(json['account']),
      authType: $enumDecodeNullable(_$AuthTypeEnumMap, json['authType']) ??
          AuthType.login,
      authStatus:
          $enumDecodeNullable(_$AuthStatusEnumMap, json['authStatus']) ??
              AuthStatus.initial,
    );

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
      'account': instance.account,
      'authType': _$AuthTypeEnumMap[instance.authType]!,
      'authStatus': _$AuthStatusEnumMap[instance.authStatus]!,
    };

const _$AuthTypeEnumMap = {
  AuthType.signUp: 'signUp',
  AuthType.login: 'login',
};

const _$AuthStatusEnumMap = {
  AuthStatus.initial: 'initial',
  AuthStatus.loading: 'loading',
  AuthStatus.success: 'success',
  AuthStatus.failure: 'failure',
  AuthStatus.noConnection: 'noConnection',
  AuthStatus.accountExistFailure: 'accountExistFailure',
  AuthStatus.accountNotExistFailure: 'accountNotExistFailure',
};
