import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_clone/commands/commands-queries.dart';
import 'package:haggle_clone/configiration/qlconfig.dart';
import 'package:haggle_clone/models/countries.dart';

class CountryPickerController extends GetxController {
  List<GetActiveCountries> countries;
  GetActiveCountries selectedCountry;
  TextEditingController searchController;
  QueryMutation _actions = QueryMutation();
  bool loading;
  @override
  void onInit() {
    countries = <GetActiveCountries>[];
    searchController = new TextEditingController();
    loading = true;
    getActiveCountries();
    super.onInit();
  }

  Future getActiveCountries() async {
    loading = true;
    final QueryOptions options = QueryOptions(
      documentNode: gql(_actions.getActiveCountries()),
    );

    var client = QLConfig.getClientWithoutAuth();

    QueryResult result = await client.value.query(options);
    if (!result.hasException) {
      print(result.data['getActiveCountries']);
      for (var item in result.data['getActiveCountries']) {
        countries.add(GetActiveCountries.fromJson(item));
      }
    } else {
      //handle error
    }
    loading = false;
    update();
  }

  //dispose text controllers after use
  @override
  void onClose() {
    super.onClose();
  }
}
