import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/controllers/verification-controller.dart';
import 'package:haggle_clone/utils.dart/margin.dart';
import 'package:haggle_clone/utils.dart/text-input.dart';
import 'package:haggle_clone/widgets/button.dart';

class VerificationScreen extends StatelessWidget {
  final VerificationController _verificationController =
      Get.put(VerificationController());

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
              padding: const EdgeInsets.only(bottom: 30, left: 15, top: 30),
              child: Text("Verify your account!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold)),
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Image.asset(
                            "assets/images/completed.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 40.0, bottom: 18, top: 40, right: 40),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text:
                                      'We just sent a verification code to your email ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontFamily: 'BasisGrotesquePro'),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Please enter the code',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontFamily: 'BasisGrotesquePro'),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        YMargin(20),
                        GetBuilder<VerificationController>(
                            builder: (value) => TextInput(
                                controller:
                                    _verificationController.codeController,
                                keyboardType: TextInputType.number,
                                borderColor: Colors.black,
                                focusedBorderColor: Colors.black,
                                labelText: "Verification code",
                                isPassword: false,
                                textColor: Colors.black,
                                labelTextColor: Colors.black)),
                        YMargin(25),
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
                            text: 'VERIFY ME',

                            onPressed: () =>
                                _verificationController.verifyCode(context),
                            //width: Get.width * 0.8,
                            height: Get.height * 0.07,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 40, left: 15),
                          child: Text('The code will expire in 10 minutes',
                              style: TextStyle(fontSize: 11)),
                        ),
                        InkWell(
                          onTap: () =>
                              _verificationController.resendCode(context),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 40, left: 15),
                            child: Text('Resend Code',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        YMargin(30)
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
