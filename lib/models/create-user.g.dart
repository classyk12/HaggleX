// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) {
  return CreateUserRequest(
    json['email'] as String,
    json['userName'] as String,
    json['referralCode'] as String,
    json['currency'] as String,
    json['phoneNumber'] as String,
    json['password'] as String,
    json['country'] as String,
    json['phoneNumberDetails'] == null
        ? null
        : PhoneNumberDetail.fromJson(
            json['phoneNumberDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'referralCode': instance.referralCode,
      'country': instance.country,
      'phoneNumberDetails': instance.phoneNumberDetails,
      'currency': instance.currency,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['email'] as String,
    json['phoneNumber'] as String,
    json['phoneNumberDetail'] == null
        ? null
        : PhoneNumberDetail.fromJson(
            json['phoneNumberDetail'] as Map<String, dynamic>),
    json['referralCode'] as String,
    (json['totalReferralEarning'] as num)?.toDouble(),
    json['referralCount'] as int,
    json['tradeCount'] as int,
    (json['avgTradeRating'] as num)?.toDouble(),
    json['username'] as String,
    json['kycStatus'] as String,
    json['emailVerified'] as bool,
    json['phoneNumberVerified'] as bool,
    json['active'] as bool,
    json['suspended'] as bool,
  )..createdAt = json['createdAt'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'referralCode': instance.referralCode,
      'phoneNumberDetail': instance.phoneNumberDetail,
      'totalReferralEarning': instance.totalReferralEarning,
      'referralCount': instance.referralCount,
      'tradeCount': instance.tradeCount,
      'avgTradeRating': instance.avgTradeRating,
      'username': instance.username,
      'kycStatus': instance.kycStatus,
      'emailVerified': instance.emailVerified,
      'phoneNumberVerified': instance.phoneNumberVerified,
      'active': instance.active,
      'suspended': instance.suspended,
      'createdAt': instance.createdAt,
    };

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    // json['user'] as String,
    json['token'] as String,
  );
}

Map<String, dynamic> _$CreateUserResponseToJson(CreateUserResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

PhoneNumberDetail _$PhoneNumberDetailFromJson(Map<String, dynamic> json) {
  return PhoneNumberDetail(
    json['callingCode'] as String,
    json['flag'] as String,
    json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$PhoneNumberDetailToJson(PhoneNumberDetail instance) =>
    <String, dynamic>{
      'callingCode': instance.callingCode,
      'flag': instance.flag,
      'phoneNumber': instance.phoneNumber,
    };
