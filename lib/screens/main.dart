import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:haggle_clone/screens/countrypicker.dart';
import 'package:haggle_clone/screens/dashboard.dart';
import 'package:haggle_clone/screens/login.dart';
import 'package:haggle_clone/screens/setup-complete.dart';
import 'package:haggle_clone/screens/signup.dart';
import 'package:haggle_clone/screens/splash_screen.dart';
import 'package:haggle_clone/screens/verification.dart';
import 'package:haggle_clone/utils.dart/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: primaryPurple,
    statusBarBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    //runApp();
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  //final ValueNotifier<GraphQLClient> client;

  //const MyApp({Key key, this.client}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(fontFamily: 'BasisGrotesquePro', primaryColor: white),
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
            page: () => DashboardScreen(),
          ),
          GetPage(
            name: '/countrycode-picker',
            page: () => CountryPickerScreen(),
          ),
        ]);
  }
}
