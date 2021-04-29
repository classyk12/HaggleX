import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/controllers/country-picker-controller.dart';
import 'package:haggle_clone/controllers/signup-controller.dart';
import 'package:haggle_clone/helpers/connection-checker.dart';
import 'package:haggle_clone/utils.dart/country-picker.dart';
import 'package:haggle_clone/utils.dart/margin.dart';
import 'package:haggle_clone/utils.dart/themes.dart';
import 'package:haggle_clone/widgets/button.dart';

class CountryPickerScreen extends StatelessWidget {
  final SignUpController _signUpController = Get.find();
  final CountryPickerController _pickerController =
      Get.put(CountryPickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: primaryPurple,
          ),
          child: ListView(
            children: [
              GetBuilder<CountryPickerController>(
                builder: (x) {
                  if (_pickerController.progress == LoadingProgress.loading) {
                    return Container();
                  } else if (_pickerController.progress ==
                      LoadingProgress.done) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 30, right: 40.0, bottom: 20),
                      child: SearchCountryWidget(
                        onSubmit: (val) => _pickerController
                            .searchCountry(x.searchController.text.trim()),
                        searchController: _pickerController.searchController,
                        onChanged: (val) => _pickerController
                            .searchCountry(x.searchController.text.trim()),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              GetBuilder<CountryPickerController>(
                builder: (b) {
                  if (b.progress == LoadingProgress.loading) {
                    return Container();
                  } else if (b.progress == LoadingProgress.done) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                          height: 1.5,
                          color: Colors.grey[500].withOpacity(0.2)),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              GetBuilder<CountryPickerController>(
                builder: (_pickerController) {
                  if (_pickerController.progress == LoadingProgress.loading) {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            YMargin(Get.height * 0.4),
                            CircularProgressIndicator.adaptive(
                                backgroundColor: white),
                            Text('Loading countries',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ]),
                    );
                  } else if (_pickerController.progress ==
                      LoadingProgress.done) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _pickerController.countries.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                _signUpController.selectedCountry =
                                    _pickerController.countries[i];
                                _signUpController.update();
                                Get.back();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.network(
                                          '${_pickerController.countries[i].flag}',
                                          placeholderBuilder: (context) =>
                                              Container(
                                                height: 10,
                                                width: 10,
                                                child:
                                                    CircularProgressIndicator(
                                                  backgroundColor: white,
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
                                          '  (+${_pickerController.countries[i].callingCode})  ${_pickerController.countries[i].name}',
                                          style: TextStyle(
                                              color: white, fontSize: 12))
                                    ]),
                              ),
                            );
                          }),
                    );
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            YMargin(Get.height * 0.4),
                            Text('An Error occured while retriving data...',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            YMargin(15),
                            Button(
                                text: 'try again',
                                onPressed: () {
                                  InternetHelper.checkInternet(
                                      function: () =>
                                          _pickerController.retry());
                                },
                                width: Get.width * 0.5,
                                height: Get.height * 0.07,
                                color: buttonYellow)
                          ]),
                    );
                  }
                },
              )
            ],
          )),
    );
  }
}
