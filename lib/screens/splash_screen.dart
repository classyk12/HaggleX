import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:haggle_clone/helpers/storage-helper.dart';
import 'package:haggle_clone/utils.dart/margin.dart';
import 'package:haggle_clone/utils.dart/themes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      var token = Storage.read('token');
      if (token != null) {
        Get.offNamed('/dashboard');
      } else {
        Get.offNamed('/login');
      }
    });
  }

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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo1.png',
                      height: 50.0, width: 50),
                  YMargin(30),
                  Text('HaggleX',
                      style: TextStyle(
                          color: white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          fontFamily: 'BasisGrotesquePro'))
                ]),
          )),
    );
  }

  @override
  void dispose() {
//    t.cancel();
    super.dispose();
  }
}
