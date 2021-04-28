import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/controllers/country-picker-controller.dart';
import 'package:haggle_clone/controllers/signup-controller.dart';
import 'package:haggle_clone/utils.dart/country-picker.dart';
import 'package:haggle_clone/utils.dart/margin.dart';

class CountryPickerScreen extends StatelessWidget {
  final SignUpController _signUpController = Get.find();

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
              GetBuilder<CountryPickerController>(
                init: CountryPickerController(),
                builder: (x) {
                  return x.loading
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 30, right: 40.0, bottom: 20),
                          child: SearchCountryWidget(
                            searchController: x.searchController,
                          ),
                        );
                },
              ),
              GetBuilder<CountryPickerController>(
                builder: (b) {
                  return b.loading
                      ? Container()
                      : Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Container(
                              height: 1.5,
                              color: Colors.grey[500].withOpacity(0.2)),
                        );
                },
              ),
              GetBuilder<CountryPickerController>(
                init: CountryPickerController(),
                builder: (c) {
                  return c.loading
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                YMargin(Get.height * 0.4),
                                CircularProgressIndicator.adaptive(
                                    backgroundColor: Colors.white),
                                Text('Loading countries',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ]),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: c.countries.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    _signUpController.selectedCountry =
                                        c.countries[i];
                                    _signUpController.update();
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.network(
                                              '${c.countries[i].flag}',
                                              placeholderBuilder: (context) =>
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    child:
                                                        CircularProgressIndicator(
                                                      backgroundColor:
                                                          Colors.white,
                                                      strokeWidth: 1,
                                                    ),
                                                  ),
                                              semanticsLabel: 'country Logo',
                                              height: 10,
                                              width: 10),
                                          // Image.asset('assets/images/flag.png',
                                          //     height: 30, width: 30),
                                          XMargin(5),
                                          Text(
                                              '  (+${c.countries[i].callingCode})  ${c.countries[i].name}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12))
                                        ]),
                                  ),
                                );
                              }),
                        );
                },
              )
            ],
          )),
    );
  }
}
