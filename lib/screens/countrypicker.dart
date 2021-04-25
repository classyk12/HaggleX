import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/controllers/login-controller.dart';
import 'package:haggle_clone/utils.dart/country-picker.dart';
import 'package:haggle_clone/utils.dart/margin.dart';

class CountryPickerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: Color(0xff2E1963),
            // image: DecorationImage(
            //   image: AssetImage("assets/images/splash-bg.png"),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: ListView(
            children: [
              GetBuilder<LoginController>(
                init: LoginController(),
                builder: (x) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 30, right: 40.0, bottom: 20),
                    child: SearchCountryWidget(
                      searchController: x.usernameController,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                    height: 1.5, color: Colors.grey[500].withOpacity(0.2)),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/flag.png',
                                  height: 30, width: 30),
                              XMargin(5),
                              Text('  (+234) Nigeria',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ]),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
