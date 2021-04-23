import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/controllers/login-controller.dart';
import 'package:haggle_clone/helpers/connection-checker.dart';
import 'package:haggle_clone/utils.dart/margin.dart';
import 'package:haggle_clone/utils.dart/text-input.dart';
import 'package:haggle_clone/utils.dart/themes.dart';
import 'package:haggle_clone/widgets/button.dart';

class VerificationScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          child: ListView(
            children: <Widget>[
              YMargin(40),
              Image.asset('assets/images/loginImage.png',
                  width: Get.width, height: Get.height * 0.3),
              TextInput(
                controller: _loginController.usernameController,
                keyboardType: TextInputType.emailAddress,
                borderColor: Colors.grey,
                focusedBorderColor: Colors.grey,
                labelText: "Email",
                isPassword: false,
                textColor: Colors.black,
                labelTextColor: Colors.grey[600],
              ),
              GetBuilder<LoginController>(
                  builder: (value) => TextInput(
                      icon: Icons.remove_red_eye,
                      //  iconAction: () => value.showPassword(),
                      controller: _loginController.passwordController,
                      keyboardType: TextInputType.text,
                      borderColor: Colors.grey,
                      focusedBorderColor: Colors.grey,
                      labelText: "Password",
                      isPassword: value.isPassword,
                      textColor: Colors.black,
                      labelTextColor: Colors.grey[600])),
              Align(
                  alignment: Alignment.centerRight,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                      onPressed: () {
                        Get.toNamed('/forgot-password');
                      },
                      child: Text("Forgot password?",
                          style: TextStyle(color: Colors.black87)))),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 10.0, right: 20, left: 20.0),
                child: Button(
                    text: 'Sign In',
                    onPressed: () {
                      InternetHelper.checkInternet(
                          function: () => _loginController.login());
                    },
                    width: Get.width * 0.8,
                    height: 45,
                    color: onboardingButtonColor),
              ),
              YMargin(15),
              Center(
                  child: Text('Or sign in with',
                      style: TextStyle(color: Colors.black, fontSize: 16))),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          InternetHelper.checkInternet(function: () => null);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0, left: 10),
                          child: Image.asset(
                            'assets/images/facebooklogo.png',
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      GetPlatform.isIOS
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(right: 12.0, left: 10),
                              child: Image.asset(
                                'assets/images/applelogo.png',
                                height: 45,
                                width: 45,
                              ),
                            )
                          : Container(width: Get.width * 0.05),
                      InkWell(
                        onTap: () {
                          InternetHelper.checkInternet(function: () => null);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0, left: 5),
                          child: Image.asset(
                            'assets/images/googlelogo.jpeg',
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, top: 10),
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        InkWell(
                            onTap: () {
                              Get.toNamed('/signup');
                            },
                            child: Text(' Sign Up',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: onboardingButtonColor,
                                    fontWeight: FontWeight.bold)))
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
