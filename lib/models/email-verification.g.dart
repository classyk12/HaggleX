// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email-verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerificationRequest _$EmailVerificationRequestFromJson(
    Map<String, dynamic> json) {
  return EmailVerificationRequest(
    json['emailInput'] as String,
  );
}

Map<String, dynamic> _$EmailVerificationRequestToJson(
        EmailVerificationRequest instance) =>
    <String, dynamic>{
      'emailInput': instance.emailInput,
    };

EmailVerificationResponse _$EmailVerificationResponseFromJson(
    Map<String, dynamic> json) {
  return EmailVerificationResponse(
    json['scalar'] as bool,
  );
}

Map<String, dynamic> _$EmailVerificationResponseToJson(
        EmailVerificationResponse instance) =>
    <String, dynamic>{
      'scalar': instance.scalar,
    };
