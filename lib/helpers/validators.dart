import 'package:get/get.dart';

class Validators {
  static ValidateFormResponse validateLogin(String email, String password) {
    if (email.isEmpty || !email.isEmail) {
      return ValidateFormResponse(
          status: false, message: "enter a valid email");
    }
    if (password.isEmpty || password.length < 8) {
      return ValidateFormResponse(
          status: false,
          message:
              'enter a valid password - 8 characters minimum for password)');
    }
    return ValidateFormResponse(status: true, message: 'validation passed');
  }

  static ValidateFormResponse validateRegister(
      String email, String password, String phoneNumber, String userName) {
    if (email.isEmpty || !email.isEmail) {
      return ValidateFormResponse(
          status: false, message: "enter a valid email");
    }
    if (password.isEmpty || password.length < 8) {
      return ValidateFormResponse(
          status: false,
          message:
              'enter a valid password - 8 characters minimum for password)');
    }
    if (!phoneNumber.isPhoneNumber || phoneNumber.length < 10) {
      return ValidateFormResponse(
          status: false,
          message:
              'enter a valid phone number - 10 characters minimum for phone numbers)');
    }
    if (userName.isEmpty || userName.length < 3) {
      return ValidateFormResponse(
          status: false,
          message:
              'enter a valid username - 3 characters minimum for username)');
    }
    return ValidateFormResponse(status: true, message: 'validation passed');
  }
}

class ValidateFormResponse {
  bool status;
  String message;

  ValidateFormResponse({this.status, this.message});
}
