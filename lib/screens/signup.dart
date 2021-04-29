import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/controllers/signup-controller.dart';
import 'package:haggle_clone/helpers/connection-checker.dart';
import 'package:haggle_clone/utils.dart/margin.dart';
import 'package:haggle_clone/utils.dart/text-input.dart';
import 'package:haggle_clone/utils.dart/themes.dart';
import 'package:haggle_clone/widgets/button.dart';

class RegisterScreen extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());

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
                color: white,
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
                        GetBuilder<SignUpController>(
                            builder: (value) => TextInput(
                                focusNode: value.emailfocusNode,
                                controller: _signUpController.emailController,
                                keyboardType: TextInputType.emailAddress,
                                borderColor: black,
                                focusedBorderColor: secondaryPurple,
                                labelText: "Email Address",
                                isPassword: false,
                                textColor: black,
                                labelTextColor: value.emailcolor)),
                        YMargin(15),
                        GetBuilder<SignUpController>(
                            builder: (value) => TextInput(
                                controller:
                                    _signUpController.passwordController,
                                keyboardType: TextInputType.text,
                                borderColor: black,
                                focusedBorderColor: secondaryPurple,
                                labelText: "Password (Min 8 characters)",
                                isPassword: true,
                                textColor: black,
                                focusNode: value.passwordfocusNode,
                                labelTextColor: value.passwordColor)),
                        YMargin(15),
                        GetBuilder<SignUpController>(
                            builder: (value) => TextInput(
                                controller:
                                    _signUpController.userNameController,
                                keyboardType: TextInputType.text,
                                borderColor: black,
                                focusedBorderColor: secondaryPurple,
                                labelText: "Create a username",
                                isPassword: false,
                                focusNode: value.usernamefocusNode,
                                labelTextColor: value.usernameColor)),
                        YMargin(15),
                        InkWell(
                          onTap: () => Get.toNamed('/countrycode-picker'),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                XMargin(10),
                                Column(
                                  children: [
                                    YMargin(15),
                                    Container(
                                      width: Get.width * 0.2,
                                      decoration: BoxDecoration(
                                          color: Color(0xffE8E8E8),
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(
                                              color: Colors.grey[400])),

                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: GetBuilder<SignUpController>(
                                          builder: (s) {
                                            return Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SvgPicture.network(
                                                      s.selectedCountry.flag,
                                                      placeholderBuilder:
                                                          (context) =>
                                                              Container(
                                                                height: 10,
                                                                width: 10,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  strokeWidth:
                                                                      1,
                                                                ),
                                                              ),
                                                      semanticsLabel:
                                                          'country Logo',
                                                      height: 9,
                                                      width: 9),
                                                  Expanded(
                                                    child: Text(
                                                        '  (+${s.selectedCountry.callingCode})',
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            color: black)),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ), //#0000001A
                                    ),
                                  ],
                                ),
                                GetBuilder<SignUpController>(
                                    builder: (value) => Expanded(
                                          child: SizedBox(
                                            width: Get.width * 0.7,
                                            child: TextInput(
                                                controller: _signUpController
                                                    .phoneNumberController,
                                                keyboardType:
                                                    TextInputType.phone,
                                                borderColor: black,
                                                focusedBorderColor:
                                                    secondaryPurple,
                                                labelText:
                                                    "Enter your phone number",
                                                isPassword: false,
                                                textColor: black,
                                                labelTextColor: black),
                                          ),
                                        )),
                              ]),
                        ),
                        YMargin(20),
                        GetBuilder<SignUpController>(
                            builder: (value) => TextInput(
                                controller:
                                    _signUpController.referralCodeController,
                                keyboardType: TextInputType.text,
                                borderColor: black,
                                focusedBorderColor: secondaryPurple,
                                labelText: "Referral code (optional)",
                                isPassword: false,
                                focusNode: value.referralfocusNode,
                                labelTextColor: value.referralColor)),
                        YMargin(15),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 40, left: 15),
                          child: Text(
                              'By signing, you agree to HaggleX terms and privacy policy.',
                              style: TextStyle(fontSize: 11)),
                        ),
                        GetBuilder<SignUpController>(
                          builder: (x) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 15, bottom: 25),
                              child: Button(
                                buttonColor: white,
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
                                  InternetHelper.checkInternet(
                                      function: () => x.createUser(context));
                                },
                                //width: Get.width * 0.8,
                                height: Get.height * 0.07,
                              ),
                            );
                          },
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
                                        color: white,
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
