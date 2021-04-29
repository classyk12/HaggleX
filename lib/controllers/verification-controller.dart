import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_clone/commands/commands-queries.dart';
import 'package:haggle_clone/configiration/qlconfig.dart';
import 'package:haggle_clone/controllers/signup-controller.dart';
import 'package:haggle_clone/models/create-user.dart';
import 'package:haggle_clone/widgets/common.dart';
import 'package:haggle_clone/widgets/loader.dart';

class VerificationController extends GetxController {
  TextEditingController codeController;
  SignUpController _signUpController = Get.find();
  FocusNode focusNode;
  QueryMutation _actions = QueryMutation();
  Color color = Colors.black;
  User response;

  @override
  void onInit() {
    codeController = new TextEditingController();
    focusNode = new FocusNode();
    focusNode.addListener(_onOnFocusNodeEvent);
    super.onInit();
  }

  _onOnFocusNodeEvent() {
    color = focusNode.hasFocus ? Color(0xffBA3AF9) : Colors.black;
    update();
  }

  Future verifyCode(BuildContext context) async {
    if (codeController.text.trim().isEmpty) {
      CommonDialogs.showSnackInfo('Validation error', "enter a valid code",
          Icons.error, Colors.red[900]);
      return;
    }
    //start loading
    ImageLoader.show(context);
    final MutationOptions options =
        // ignore: deprecated_member_use
        MutationOptions(
            documentNode: gql(_actions.verifyUser()),
            variables: {"code": int.parse(codeController.text)});

    var client = QLConfig.getClientWithAuth();
    QueryResult result = await client.value.mutate(options);
    if (!result.hasException) {
      ImageLoader.hide();
      Get.offAllNamed('/setup-complete');
    } else {
      ImageLoader.hide();
      CommonDialogs.showSnackInfo(
          'Error',
          result.exception.graphqlErrors.first.message ?? 'An error occurred',
          Icons.error,
          Colors.deepPurple[300]);
      return;
    }
  }

  Future resendCode(BuildContext context) async {
    //start loading
    ImageLoader.show(context);
    final QueryOptions options =
        // ignore: deprecated_member_use
        QueryOptions(
            documentNode: gql(_actions.resendCode()),
            variables: {"email": _signUpController.emailController.text});

    var client = QLConfig.getClientWithAuth();

    QueryResult result = await client.value.query(options);
    if (!result.hasException) {
      ImageLoader.hide();
      CommonDialogs.showSnackInfo('Code resent', "code resent successfully ",
          Icons.error, Colors.green[900]);
    } else {
      ImageLoader.hide();
      CommonDialogs.showSnackInfo(
          'Error',
          result.exception.graphqlErrors.first.message ?? 'An error occurred',
          Icons.error,
          Colors.deepPurple[300]);
      return;
    }
  }

  //dispose text controllers after use
  @override
  void onClose() {
    codeController?.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
