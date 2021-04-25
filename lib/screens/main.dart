import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/screens/dashboard.dart';
import 'package:haggle_clone/screens/login.dart';
import 'package:haggle_clone/screens/setup-complete.dart';
import 'package:haggle_clone/screens/signup.dart';
import 'package:haggle_clone/screens/splash_screen.dart';
import 'package:haggle_clone/screens/tabs-page.dart';
import 'package:haggle_clone/screens/verification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFF2E1963),
    statusBarBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
            fontFamily: 'BasisGrotesquePro', primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        title: 'HaggleX',
        initialRoute: '/splash',
        getPages: [
          GetPage(
            name: '/splash',
            page: () => SplashScreen(),
          ),
          GetPage(name: '/login', page: () => LoginScreen()),
          GetPage(
            name: '/register',
            page: () => RegisterScreen(),
          ),
          GetPage(
            name: '/setup-complete',
            page: () => SetUpCompleteScreen(),
          ),
          GetPage(
            name: '/verification',
            page: () => VerificationScreen(),
          ),
          GetPage(
            name: '/dashboard',
            page: () => TabsPage(),
          ),
        ]);
  }
}
