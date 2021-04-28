import 'package:json_annotation/json_annotation.dart';

part 'verify-user.g.dart';

@JsonSerializable()
class ResendCodeResponse {
  bool resendVerificationCode;

  ResendCodeResponse(this.resendVerificationCode);
  factory ResendCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyUserResponseFromJson(json);
}
