import 'package:json_annotation/json_annotation.dart';

part 'create-user.g.dart';

@JsonSerializable()
class CreateUserRequest {
  String email;
  String userName;
  String phoneNumber;
  String password;
  String referralCode;
  String country;
  PhoneNumberDetail phoneNumberDetails;
  String currency;

  CreateUserRequest(this.email, this.userName, this.referralCode, this.currency,
      this.phoneNumber, this.password, this.country, this.phoneNumberDetails);
  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}

@JsonSerializable()
class User {
  String id;
  String email;
  String phoneNumber;
  String referralCode;
  PhoneNumberDetail phoneNumberDetail;
  double totalReferralEarning;
  int referralCount;
  int tradeCount;
  double avgTradeRating;
  String username;
  String kycStatus;
  bool emailVerified;
  bool phoneNumberVerified;
  bool active;
  bool suspended;
  String createdAt;

  User(
    this.id,
    this.email,
    this.phoneNumber,
    this.phoneNumberDetail,
    this.referralCode,
    this.totalReferralEarning,
    this.referralCount,
    this.tradeCount,
    this.avgTradeRating,
    this.username,
    this.kycStatus,
    this.emailVerified,
    this.phoneNumberVerified,
    this.active,
    this.suspended,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(nullable: false)
class CreateUserResponse {
  String token;
  User user;

  CreateUserResponse(this.user, this.token);
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);
}

@JsonSerializable(nullable: false)
class PhoneNumberDetail {
  String callingCode;
  String flag;
  String phoneNumber;

  PhoneNumberDetail(this.callingCode, this.flag, this.phoneNumber);

  factory PhoneNumberDetail.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneNumberDetailToJson(this);
}
