import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
  // AuthService _socialLoginService = locator<SocialLogin>();
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool isPassword = true;
//when the page is allocated in memory
  @override
  void onInit() {
    usernameController = new TextEditingController();
    passwordController = new TextEditingController();
    super.onInit();
  }

  Future login() async {}

  showPassword() {
    this.isPassword = !this.isPassword;
    update();
  }

  //dispose text controllers after use
  @override
  void onClose() {
    usernameController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }
}
