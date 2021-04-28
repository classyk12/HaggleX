// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify-user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendCodeResponse _$VerifyUserResponseFromJson(Map<String, dynamic> json) {
  return ResendCodeResponse(
    json['resendVerificationCode'] as bool,
  );
}

Map<String, dynamic> _$ResendCodeResponseToJson(ResendCodeResponse instance) =>
    <String, dynamic>{
      'resendVerificationCode': instance.resendVerificationCode,
    };
