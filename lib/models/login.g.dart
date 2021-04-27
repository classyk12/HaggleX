// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return LoginRequest(
    json['input'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'input': instance.input,
      'password': instance.password,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    json['token'] as String,
    json['twoFactorAuth'] as bool,
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'twoFactorAuth': instance.twoFactorAuth,
      'user': instance.user,
    };
