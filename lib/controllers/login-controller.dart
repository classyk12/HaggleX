import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool isPassword = true;
  FocusNode focusNode;

  @override
  void onInit() {
    usernameController = new TextEditingController();
    passwordController = new TextEditingController();
    focusNode = new FocusNode();
    //_focusNode.addListener(_onOnFocusNodeEvent);
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
    focusNode.dispose();
    super.onClose();
  }
}
