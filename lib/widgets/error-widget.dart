import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorSheet extends StatelessWidget {
  final String title;
  final String body;
  final Icon icon;

  ErrorSheet({this.title, this.body, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        height: Get.height * 0.30,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.error,
                    color: Colors.red[900],
                    size: 60,
                  ),
                ),
                Text(title,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(body),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 4.0, right: 4.0, top: 8.0, bottom: 8.0),
                  child: Divider(color: Colors.grey[300]),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Text('Close',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                )
              ]),
        ),
      ),
    );
  }
}
