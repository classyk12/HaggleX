import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_clone/commands/commands-queries.dart';
import 'package:haggle_clone/configiration/qlconfig.dart';
import 'package:haggle_clone/helpers/storage-helper.dart';
import 'package:haggle_clone/models/countries.dart';

class CountryPickerController extends GetxController {
  List<GetActiveCountries> countries;

  GetActiveCountries selectedCountry;
  TextEditingController searchController;
  QueryMutation _actions = QueryMutation();
  LoadingProgress progress;
  List<GetActiveCountries> duplicateItems;
  @override
  void onInit() {
    duplicateItems = <GetActiveCountries>[];
    searchController = new TextEditingController();
    checkStorage();
    super.onInit();
  }

  Future getActiveCountries() async {
    progress = LoadingProgress.loading;

    final QueryOptions options = QueryOptions(
      documentNode: gql(_actions.getActiveCountries()),
    );

    var client = QLConfig.getClientWithoutAuth();

    QueryResult result = await client.value.query(options);
    progress = LoadingProgress.done;
    if (!result.hasException) {
      print(result.data['getActiveCountries']);
      for (var item in result.data['getActiveCountries']) {
        countries.add(GetActiveCountries.fromJson(item));
      }

      //persist data in local storage
      Storage.save('countries', json.encode(countries));
      print('saved');
    } else {
      //handle error
      progress = LoadingProgress.error;
    }

    update();
  }

  searchCountry(String query) {
    print('searching...');
    List<GetActiveCountries> dummySearchList = <GetActiveCountries>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<GetActiveCountries> dummyListData = <GetActiveCountries>[];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.currencyCode.toLowerCase().contains(query.toLowerCase()) ||
            item.callingCode.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });

      countries.clear();
      countries.addAll(dummyListData);
      update();

      return;
    } else {
      countries.clear();
      countries.addAll(duplicateItems);
      update();
    }
  }

  void checkStorage() {
    countries = <GetActiveCountries>[];
    var encoded = Storage.read('countries');
    if (encoded != null) {
      var x = json.decode(encoded);
      countries = List<GetActiveCountries>.from(
          x.map((i) => GetActiveCountries.fromJson(i)));
      progress = LoadingProgress.done;
      update();
    } else {
      getActiveCountries();
    }
    duplicateItems.addAll(countries);
  }

  //dispose text controllers after use
  @override
  void onClose() {
    // super.onClose();
  }
}

enum LoadingProgress { loading, done, error }
