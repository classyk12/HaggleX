import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/controllers/login-controller.dart';
import 'package:haggle_clone/helpers/connection-checker.dart';
import 'package:haggle_clone/utils.dart/margin.dart';
import 'package:haggle_clone/utils.dart/text-input.dart';
import 'package:haggle_clone/utils.dart/themes.dart';
import 'package:haggle_clone/widgets/button.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 10),
                child: Text("Welcome!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
              ),
              GetBuilder<LoginController>(
                builder: (x) {
                  return TextInput(
                    focusNode: x.focusNode,
                    controller: _loginController.usernameController,
                    keyboardType: TextInputType.emailAddress,
                    borderColor: Colors.white,
                    focusedBorderColor: Color(0xffBA3AF9),
                    labelText: "Email Address",
                    isPassword: false,
                    textColor: Colors.white,
                    labelTextColor:
                        x.focusNode.hasFocus ? Color(0xffBA3AF9) : Colors.white,
                  );
                },
              ),
              YMargin(20),
              GetBuilder<LoginController>(
                  builder: (value) => TextInput(
                      icon: Icons.remove_red_eye,
                      iconAction: () => value.showPassword(),
                      controller: _loginController.passwordController,
                      keyboardType: TextInputType.text,
                      borderColor: Colors.white,
                      focusedBorderColor: Color(0xffBA3AF9),
                      labelText: "Password (Min. 8 characters)",
                      isPassword: value.isPassword,
                      textColor: Colors.white,
                      labelTextColor: Colors.white)),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                        onPressed: () => null,
                        child: Text("Forgot Password?",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)))),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15, bottom: 25),
                child: Button(
                    text: 'LOG IN',
                    onPressed: () {
                      InternetHelper.checkInternet(
                          function: () => _loginController.login(context));
                    },
                    //width: Get.width * 0.8,
                    height: Get.height * 0.07,
                    color: buttonYellow),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, top: 10),
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () => Get.toNamed('/register'),
                          child: Text(
                            "New User? Create a new account",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12),
                          ),
                        ),
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
