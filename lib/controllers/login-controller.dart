import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_clone/commands/commands-queries.dart';
import 'package:haggle_clone/configiration/qlconfig.dart';
import 'package:haggle_clone/helpers/storage-helper.dart';
import 'package:haggle_clone/models/login.dart';

class LoginController extends GetxController {
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool isPassword = true;
  FocusNode focusNode;
  QueryMutation _actions = QueryMutation();
  LoginResponse response;

  @override
  void onInit() {
    usernameController = new TextEditingController();
    passwordController = new TextEditingController();
    focusNode = new FocusNode();
    //_focusNode.addListener(_onOnFocusNodeEvent);
    super.onInit();
  }

  Future login() async {
    final MutationOptions options =
        // ignore: deprecated_member_use
        MutationOptions(documentNode: gql(_actions.login()), variables: {
      "input": usernameController.text,
      "password": passwordController.text
    });

    var client = QLConfig.getClientWithoutAuth();

    QueryResult result = await client.value.mutate(options);
    if (!result.hasException) {
      print(result.data['login']);

      response = LoginResponse.fromJson(result.data['login']);

      //todo: save data in local storage
      Storage.save('token', response.token);
      Storage.save('username', response.user.username);
      print('stored');
      Get.toNamed('/dashboard');

      //todo: save data in local storage

    }
    print(result.exception.graphqlErrors.first.message);
    update();
  }

  showPassword() {
    this.isPassword = !this.isPassword;
    update();
  }

  //dispose text controllers after use
  @override
  void onClose() {
    usernameController?.dispose();
    passwordController?.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
