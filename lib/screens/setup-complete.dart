import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/utils.dart/margin.dart';
import 'package:haggle_clone/utils.dart/themes.dart';
import 'package:haggle_clone/widgets/button.dart';

class SetUpCompleteScreen extends StatelessWidget {
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
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text('')),
              Image.asset(
                'assets/images/setup-complete.png',
                height: 60,
                width: 60,
              ),
              YMargin(10),
              Text("Setup Complete",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              YMargin(20),
              Text("Thank you for setting up your HaggleX account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.normal)),
              //  YMargin(15),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Button(
                    text: 'START EXPLORING',
                    onPressed: () => Get.offAllNamed('/dashboard'),
                    height: Get.height * 0.07,
                    color: buttonYellow),
              ),
              YMargin(30)
            ],
          ),
        ),
      ),
    ));
  }
}
