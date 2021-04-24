import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/controllers/login-controller.dart';

class DashboardScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(color: Colors.white, child: Text('Dashboard')));
  }
}
