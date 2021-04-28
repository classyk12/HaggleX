import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_clone/commands/commands-queries.dart';
import 'package:haggle_clone/configiration/qlconfig.dart';
import 'package:haggle_clone/controllers/signup-controller.dart';
import 'package:haggle_clone/models/create-user.dart';
import 'package:haggle_clone/models/verify-user.dart';

class VerificationController extends GetxController {
  TextEditingController codeController;
  SignUpController _signUpController = Get.find();
  FocusNode focusNode;
  QLConfig _client = QLConfig();
  QueryMutation _actions = QueryMutation();
  User response;

  @override
  void onInit() {
    codeController = new TextEditingController();
    focusNode = new FocusNode();
    //_focusNode.addListener(_onOnFocusNodeEvent);
    super.onInit();
  }

  Future verifyCode() async {
    final MutationOptions options =
        // ignore: deprecated_member_use
        MutationOptions(
            documentNode: gql(_actions.verifyUser()),
            variables: {"code": int.parse(codeController.text)});

    QueryResult result = await _client.client.value.mutate(options);
    if (!result.hasException) {
      print(result.data['verifyUser']['user']);

      response = User.fromJson(result.data['verifyUser']['user']);

      Get.offAllNamed('/setup-complete');
    }
    update();
  }

  Future resendCode() async {
    final QueryOptions options =
        // ignore: deprecated_member_use
        QueryOptions(
            documentNode: gql(_actions.resendCode()),
            variables: {"email": _signUpController.emailController.text});

    QueryResult result = await _client.client.value.query(options);
    if (!result.hasException) {
      print(result.data);

      var response = ResendCodeResponse.fromJson(result.data);

      Get.offAllNamed('/setup-complete');
    }
    print(result.exception.graphqlErrors.first.message);
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
