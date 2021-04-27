import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_clone/commands/commands-queries.dart';
import 'package:haggle_clone/configiration/qlconfig.dart';
import 'package:haggle_clone/models/login.dart';

class VerificationController extends GetxController {
  TextEditingController codeController;
  FocusNode focusNode;
  QLConfig _client = QLConfig();
  QueryMutation _actions = QueryMutation();
  LoginResponse response;

  @override
  void onInit() {
    codeController = new TextEditingController();
    focusNode = new FocusNode();
    //_focusNode.addListener(_onOnFocusNodeEvent);
    super.onInit();
  }

  Future login() async {
    final MutationOptions options =
        // ignore: deprecated_member_use
        MutationOptions(
            documentNode: gql(_actions.login()),
            variables: {"input": codeController.text});

    QueryResult result = await _client.client.value.mutate(options);
    if (!result.hasException) {
      print(result.data['login']);

      response = LoginResponse.fromJson(result.data['login']);

      //todo: save data in local storage
      Get.toNamed('/verification');
    }
    update();
  }

  //dispose text controllers after use
  @override
  void onClose() {
    codeController?.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
