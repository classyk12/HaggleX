import 'package:flutter/material.dart';
import 'package:haggle_clone/utils.dart/margin.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;
  final double fontSize;
  final BoxDecoration decoration;
  final Color buttonColor;

  Button(
      {@required this.text,
      @required this.onPressed,
      this.width = 0.0,
      this.height = 0.0,
      this.color,
      this.fontSize = 11.0,
      this.decoration,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: this.decoration ?? null,
      width: width == 0.0 ? screenWidth(context) : width,
      constraints: BoxConstraints.tightForFinite(),
      height: this.height,
      // ignore: deprecated_member_use
      child: FlatButton(
        color: this.color,
        // splashColor: Colors.white.withOpacity(0.2),
        // elevation: 8,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: this.fontSize,
                fontWeight: FontWeight.bold,
                color: this.buttonColor ?? Colors.black),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        // padding: EdgeInsets.only(left: 0, right: 0, top: 13, bottom: 13),
      ),
    );
  }
}
