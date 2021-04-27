import 'package:json_annotation/json_annotation.dart';

part 'email-verification.g.dart';

@JsonSerializable()
class EmailVerificationRequest {
  String emailInput;

  EmailVerificationRequest(this.emailInput);
  factory EmailVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EmailVerificationRequestToJson(this);
}

@JsonSerializable()
class EmailVerificationResponse {
  bool scalar;

  EmailVerificationResponse(this.scalar);
  factory EmailVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EmailVerificationResponseToJson(this);
}
