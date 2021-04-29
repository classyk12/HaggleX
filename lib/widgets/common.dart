import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/utils.dart/themes.dart';

class CommonDialogs {
  //snackbar by GET
  static showSnackInfo(String titleText, String messageText, IconData icon,
      Color backgroundColor,
      {double iconSize = 30,
      int duration = 3,
      SnackPosition position = SnackPosition.BOTTOM}) {
    return Get.snackbar("", "",
        snackStyle: SnackStyle.GROUNDED,
        titleText: Text(titleText,
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 15)),
        messageText: Text(messageText,
            style: TextStyle(color: white, fontWeight: FontWeight.w500)),
        snackPosition: position,
        duration: Duration(seconds: duration),
        icon: Icon(icon, size: iconSize, color: white),
        //  colorText: white,
        backgroundColor: backgroundColor);
  }
}
