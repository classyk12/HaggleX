import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/utils.dart/themes.dart';

class CommonDialogs {
  static showToastBar(BuildContext context, GlobalKey<ScaffoldState> key,
      {String text, Color color, Color backgroundColor}) {
    // ignore: deprecated_member_use
    key.currentState.showSnackBar(new SnackBar(
      elevation: 10,
      content: new Text(text, style: TextStyle(color: color)),
      backgroundColor: backgroundColor,
    ));
  }

  //snackbar by GET
  static showSnackInfo(String titleText, String messageText, IconData icon,
      Color backgroundColor,
      {double iconSize = 50,
      int duration = 3,
      SnackPosition position = SnackPosition.TOP}) {
    return Get.rawSnackbar(
        title: '',
        message: '',
        snackStyle: SnackStyle.GROUNDED,
        titleText: Text(titleText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        messageText: Text(messageText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        snackPosition: position,
        duration: Duration(seconds: duration),
        icon: Icon(icon, size: iconSize, color: Colors.white),
        //  colorText: Colors.white,
        backgroundColor: backgroundColor);
  }

  static showAlertDialog(BuildContext context, String title,
      {GlobalKey key, String message, Function() onPress}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            key: key,
            title: Text(title),
            content: Text(message),
            actions: [
              // ignore: deprecated_member_use
              FlatButton(
                child: Text("Close"),
                onPressed: (onPress != null)
                    ? onPress
                    : () {
                        Navigator.of(context).pop();
                      },
              )
            ],
          );
        });
  }

  static void actionStatusModal(context,
      {String title,
      Color headerColor,
      String message,
      String buttonText,
      Color buttonColor,
      IconData icon,
      Color iconColor,
      bool isDismissible = false,
      Widget child,
      double padding = 20,
      bool showDivider = true,
      Function() footerAction}) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        isScrollControlled: true,
        isDismissible: isDismissible,
        builder: (BuildContext bc) {
          return Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.fromLTRB(
                    padding,
                    20,
                    padding,
                    // 10,
                    MediaQuery.of(context).viewInsets.bottom + 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: new Wrap(
                    children: <Widget>[
                      (title != null)
                          ? Container(
                              margin: EdgeInsets.fromLTRB(10, 25, 10, 20),
                              alignment: Alignment.center,
                              child: Text(title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: headerColor)),
                            )
                          : Container(),
                      (message != null)
                          ? Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                              alignment: Alignment.center,
                              child: Text(message,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            )
                          : Container(),
                      (child != null) ? child : Container(),
                      (showDivider)
                          ? Divider(
                              color: Color(0xFFE0E0E0),
                            )
                          : SizedBox(),
                      Center(
                          // ignore: deprecated_member_use
                          child: FlatButton(
                              onPressed: footerAction ??
                                  () {
                                    Navigator.of(context).pop();
                                  },
                              textColor: Colors.white,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Text(buttonText ?? 'Cancel',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: buttonColor ?? Colors.red)),
                              )))
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Container(
                    padding: EdgeInsets.all(17.91),
                    margin: EdgeInsets.all(10),
                    width: 61,
                    height: 61,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (iconColor != null) ? iconColor : Colors.black),
                    child: Icon((icon != null) ? icon : Icons.info_outline,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        });
  }

  static showError(BuildContext context, {String title, String message}) {
    actionStatusModal(context,
        title: title,
        headerColor: Colors.blue,
        message: message,
        buttonText: 'Dismiss',
        buttonColor: Colors.green,
        icon: Icons.error_outline,
        iconColor: Colors.black);
  }

  static Future<void> showInfoSheet(BuildContext context, String imagePath,
      {String title, String subtitle, bool isRemoving}) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        //  isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                          isRemoving ? 'removing...' : 'adding to bookmarks..',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: isRemoving ? Colors.red : primaryGreen))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(imagePath))
                  //Text('removing')
                ],
              ),
            ),
          );
        });
  }
}

class Loader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  Loader(
      {this.title = 'Loading',
      this.subtitle = 'Please wait..',
      this.color = Colors.white});

  Widget build(BuildContext context) {
    {
      return SimpleDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          children: <Widget>[
            Center(
                child: Column(children: [
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              SizedBox(height: 25),
              Text(title,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: color)),
              SizedBox(height: 9),
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(subtitle ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: color)),
              ),
            ]))
          ]);
    }
  }
}
