import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/controllers/login-controller.dart';
import 'package:haggle_clone/utils.dart/margin.dart';
import 'package:haggle_clone/utils.dart/text-input.dart';
import 'package:haggle_clone/widgets/button.dart';

class RegisterScreen extends StatelessWidget {
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
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 0),
        child: ListView(
          children: <Widget>[
            YMargin(Get.height * 0.05),
            InkWell(
              onTap: () => Get.back(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Image.asset(
                    'assets/images/back-icon.png',
                    height: 45,
                    width: 45,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 50),
              child: Card(
                margin: EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 10, bottom: 10),
                  child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 18, top: 50),
                          child: Text("Create a new account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        GetBuilder<LoginController>(
                            builder: (value) => TextInput(
                                // icon: Icons.remove_red_eye,
                                //  iconAction: () => value.showPassword(),
                                controller: _loginController.passwordController,
                                keyboardType: TextInputType.text,
                                borderColor: Colors.black,
                                focusedBorderColor: Colors.black,
                                labelText: "Email Address",
                                isPassword: false,
                                textColor: Colors.black,
                                labelTextColor: Colors.black)),
                        YMargin(15),
                        GetBuilder<LoginController>(
                            builder: (value) => TextInput(
                                // icon: Icons.remove_red_eye,
                                //  iconAction: () => value.showPassword(),
                                controller: _loginController.passwordController,
                                keyboardType: TextInputType.text,
                                borderColor: Colors.black,
                                focusedBorderColor: Colors.black,
                                labelText: "Password (Min. 8 characters)",
                                isPassword: false,
                                textColor: Colors.black,
                                labelTextColor: Colors.black)),
                        YMargin(15),
                        GetBuilder<LoginController>(
                            builder: (value) => TextInput(
                                // icon: Icons.remove_red_eye,
                                //  iconAction: () => value.showPassword(),
                                controller: _loginController.passwordController,
                                keyboardType: TextInputType.text,
                                borderColor: Colors.black,
                                focusedBorderColor: Colors.black,
                                labelText: "Create a username",
                                isPassword: false,
                                textColor: Colors.black,
                                labelTextColor: Colors.black)),
                        YMargin(15),
                        // TextInput(
                        //   controller: _loginController.passwordController,
                        //   borderColor: Colors.grey,
                        //   focusedBorderColor: Colors.grey,
                        //   labelText: 'Phone number',
                        //   isPassword: false,
                        //   textColor: Colors.black,
                        //   labelTextColor: Colors.grey[600],
                        //   keyboardType: TextInputType.phone,
                        //   prefixWidget: Container(
                        //     width: 45,
                        //     height: 20,
                        //     child: Row(children: <Widget>[
                        //       Image.asset('assets/images/logo1.png',
                        //           height: 14, width: 14),
                        //       Padding(
                        //         padding:
                        //             const EdgeInsets.only(right: 1.0, left: 0.5),
                        //         child: Text("+234", style: TextStyle(fontSize: 10)),
                        //       )
                        //     ]),
                        //   ),
                        // ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Container(
                              //   width: 0.2,
                              //   color: Colors.red,
                              //   child: Text('pnc'),
                              // ),
                              Expanded(
                                child: GetBuilder<LoginController>(
                                    builder: (value) => TextInput(
                                        controller:
                                            _loginController.passwordController,
                                        keyboardType: TextInputType.text,
                                        borderColor: Colors.black,
                                        focusedBorderColor: Colors.black,
                                        labelText: "Enter your phone number",
                                        isPassword: false,
                                        textColor: Colors.black,
                                        labelTextColor: Colors.black)),
                              ),
                            ]),
                        YMargin(20),
                        GetBuilder<LoginController>(
                            builder: (value) => TextInput(
                                controller: _loginController.passwordController,
                                keyboardType: TextInputType.text,
                                borderColor: Colors.black,
                                focusedBorderColor: Colors.black,
                                labelText: "Referral code (optional)",
                                isPassword: false,
                                textColor: Colors.black,
                                labelTextColor: Colors.grey[400])),
                        YMargin(15),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 40, left: 15),
                          child: Text(
                              'By signing, you agree to HaggleX terms and privacy policy.',
                              style: TextStyle(fontSize: 11)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 15, bottom: 25),
                          child: Button(
                            buttonColor: Colors.white,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF432B7B),
                                  Color(0xFF6A4BBC),
                                ],
                              ),
                            ),
                            text: 'SIGN UP',

                            onPressed: () {
                              Get.toNamed('/verification');
                              // InternetHelper.checkInternet(
                              //     function: () => _loginController.login());
                            },
                            //width: Get.width * 0.8,
                            height: Get.height * 0.07,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "New User? Create a new account",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 11),
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
