import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  double width = 60;

  void animateLogo() {
    setState(() {
      width = 25;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () => animateLogo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 500),
      width: width,
      onEnd: () {
        setState(() {
          width = width == 25 ? 50 : 25;
        });
      },
      child: Center(
        child: Image.asset("assets/images/logo1.png"),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
