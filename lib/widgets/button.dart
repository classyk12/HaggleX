import 'package:flutter/material.dart';
import 'package:haggle_clone/utils.dart/margin.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;
  final double radius;

  Button(
      {@required this.text,
      @required this.onPressed,
      this.width = 0.0,
      this.height = 0.0,
      this.color,
      this.radius = 10.0});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
