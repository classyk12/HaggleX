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
  QLConfig _client = QLConfig();
  TextEditingController searchController;
  QueryMutation _actions = QueryMutation();

  @override
  void onInit() {
    countries = <GetActiveCountries>[];
    searchController = new TextEditingController();
    getActiveCountries();
    super.onInit();
  }

  Future getActiveCountries() async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(_actions.getActiveCountries()),
    );

    QueryResult result = await _client.client.value.query(options);
    if (!result.hasException) {
      print(result.data['getActiveCountries']);
      for (var item in result.data['getActiveCountries']) {
        countries.add(GetActiveCountries.fromJson(item));
      }
      // return countries;
    }
    print(result.exception.graphqlErrors.first.message);
    update();
  }

  //dispose text controllers after use
  @override
  void onClose() {
    super.onClose();
  }
}
