import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/utils.dart/themes.dart';
import 'package:haggle_clone/widgets/error-widget.dart';

class ErrorHandler {
  static String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout";
          break;
        case DioErrorType.DEFAULT:
          errorDescription = "Connection failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Connection timeout";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }

  static catchError(err) {
    try {
      //hide loader
      Get.back();
      var error = ErrorHandler._handleError(err);
      Get.bottomSheet(
          ErrorSheet(
              title: "Something went wrong",
              body: error,
              icon: Icon(Icons.error)),
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          barrierColor: Colors.grey[900].withOpacity(0.8),
          isDismissible: false,
          elevation: 20);
    } catch (ex) {
      Get.back();
    }
  }
}
