import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:haggle_clone/widgets/common.dart';

class InternetHelper {
  static checkInternet({Function function}) async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      return function();
    }
    CommonDialogs.showSnackInfo(
        ' No Internet',
        ' kindly check your internet connection',
        Icons.signal_cellular_connected_no_internet_4_bar,
        Colors.grey,
        position: SnackPosition.TOP,
        iconSize: 40);
  }
}
