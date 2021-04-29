import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_clone/commands/commands-queries.dart';
import 'package:haggle_clone/configiration/qlconfig.dart';
import 'package:haggle_clone/helpers/storage-helper.dart';
import 'package:haggle_clone/helpers/validators.dart';
import 'package:haggle_clone/models/login.dart';
import 'package:haggle_clone/utils.dart/themes.dart';
import 'package:haggle_clone/widgets/common.dart';
import 'package:haggle_clone/widgets/loader.dart';

class LoginController extends GetxController {
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool isPassword = true;
  FocusNode focusNode;
  FocusNode passwordfocusNode;
  QueryMutation _actions = QueryMutation();
  LoginResponse response;
  Color color = white;
  Color passwordStyleColor = white;

  @override
  void onInit() {
    usernameController = new TextEditingController();
    passwordController = new TextEditingController();
    focusNode = new FocusNode();
    passwordfocusNode = new FocusNode();
    focusNode.addListener(_onOnFocusNodeEvent);
    passwordfocusNode.addListener(_onOnFocusNodeEvent);
    super.onInit();
  }

  _onOnFocusNodeEvent() {
    color = focusNode.hasFocus ? Color(0xffBB9FFF) : white;
    passwordStyleColor = passwordfocusNode.hasFocus ? Color(0xffBB9FFF) : white;
    update();
  }

  Future login(BuildContext context) async {
    //validate form
    var validate = Validators.validateLogin(
        usernameController.text.trim(), passwordController.text.trim());

    if (!validate.status) {
      CommonDialogs.showSnackInfo(
          'Validation error', validate.message, Icons.error, Colors.red[900]);
      return;
    }

    //start loading
    ImageLoader.show(context);

    final MutationOptions options =
        // ignore: deprecated_member_use
        MutationOptions(documentNode: gql(_actions.login()), variables: {
      "input": usernameController.text,
      "password": passwordController.text
    });

    var client = QLConfig.getClientWithoutAuth();

    QueryResult result = await client.value.mutate(options);

    if (!result.hasException) {
      response = LoginResponse.fromJson(result.data['login']);

      //todo: save data in local storage
      Storage.save('token', response.token);
      Storage.save('username', response.user.username);
      ImageLoader.hide();
      Get.offAllNamed('/dashboard');
    } else {
      ImageLoader.hide();
      CommonDialogs.showSnackInfo(
          'Error',
          result.exception.graphqlErrors.first.message ?? 'An error occurred',
          Icons.error,
          Colors.deepPurple[300]);
      return;
    }
    // update();
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
    super.onClose();
    focusNode.dispose();
  }
}
