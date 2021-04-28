import 'package:flutter/material.dart';
import 'package:haggle_clone/widgets/animated-logo.dart';

class ImageLoader extends StatelessWidget {
  static OverlayEntry _currentLoader;
  ImageLoader._(this._progressIndicator, this._themeData, this.loaderText);
  final Widget _progressIndicator;
  final String loaderText;
  final ThemeData _themeData;
  static GlobalKey<OverlayState> _globalKey = new GlobalKey<OverlayState>();
  static OverlayState _overlayState;

  static show(BuildContext context,
      {Widget progressIndicator,
      ThemeData themeData,
      Color overlayColor,
      String loaderText = "Processing..."}) {
    _overlayState = Overlay.of(context);
    if (_currentLoader == null) {
      _currentLoader = new OverlayEntry(
        builder: (context) => new WillPopScope(
            child: Stack(
              children: <Widget>[
                SafeArea(
                  child: Container(
                    color: overlayColor ?? Color(0xFF2E1963).withOpacity(0.5),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageLoader._(progressIndicator, themeData, loaderText),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        loaderText,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                ),
              ],
            ),
            key: _globalKey,
            onWillPop: () async {
              hide();
              return true;
            }),
      );
      try {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => _overlayState?.insertAll([_currentLoader]));
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static hide() {
    if (_currentLoader != null) {
      try {
        _currentLoader.remove();
      } catch (e) {
        print(e.toString());
      } finally {
        _currentLoader = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
          data: _themeData ??
              Theme.of(context).copyWith(accentColor: Colors.blue),
          child: _progressIndicator ?? AnimatedLogo()),
    );
  }
}
