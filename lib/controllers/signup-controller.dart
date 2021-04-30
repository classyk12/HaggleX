import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_clone/commands/commands-queries.dart';
import 'package:haggle_clone/configiration/qlconfig.dart';
import 'package:haggle_clone/helpers/mock-values.dart';
import 'package:haggle_clone/helpers/storage-helper.dart';
import 'package:haggle_clone/helpers/validators.dart';
import 'package:haggle_clone/models/countries.dart';
import 'package:haggle_clone/models/create-user.dart';
import 'package:haggle_clone/utils.dart/themes.dart';
import 'package:haggle_clone/widgets/common.dart';
import 'package:haggle_clone/widgets/loader.dart';

class SignUpController extends GetxController {
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController phoneNumberController;
  TextEditingController referralCodeController;
  TextEditingController userNameController;
  CreateUserResponse response;
  GetActiveCountries selectedCountry;
  FocusNode emailfocusNode;
  FocusNode passwordfocusNode;
  FocusNode referralfocusNode;
  FocusNode usernamefocusNode;

  Color emailcolor = black;
  Color passwordColor = black;
  Color referralColor = Colors.grey[400];
  Color usernameColor = black;

  QueryMutation _actions = QueryMutation();
  bool isPassword = true;

  void onInit() {
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    referralCodeController = new TextEditingController();
    phoneNumberController = new TextEditingController();
    userNameController = new TextEditingController();
    selectedCountry = DashBoardMockClass.getDefaultValue();
    emailfocusNode = new FocusNode();
    passwordfocusNode = new FocusNode();
    referralfocusNode = new FocusNode();
    usernamefocusNode = new FocusNode();
    emailfocusNode.addListener(_onOnFocusNodeEvent);
    passwordfocusNode.addListener(_onOnFocusNodeEvent);
    referralfocusNode.addListener(_onOnFocusNodeEvent);
    usernamefocusNode.addListener(_onOnFocusNodeEvent);

    super.onInit();
  }

  _onOnFocusNodeEvent() {
    emailcolor = emailfocusNode.hasFocus ? secondaryPurple : black;
    passwordColor = passwordfocusNode.hasFocus ? secondaryPurple : black;
    referralColor =
        referralfocusNode.hasFocus ? secondaryPurple : Colors.grey[400];
    usernameColor = usernamefocusNode.hasFocus ? secondaryPurple : black;
    update();
  }

  Future createUser(BuildContext context) async {
    var validate = Validators.validateRegister(
        emailController.text.trim(),
        passwordController.text.trim(),
        phoneNumberController.text.trim(),
        userNameController.text.trim());

    if (!validate.status) {
      CommonDialogs.showSnackInfo(
          'Validation error', validate.message, Icons.error, Colors.red[900]);
      return;
    }

    //start loading
    ImageLoader.show(context);

    final MutationOptions options =
        // ignore: deprecated_member_use
        MutationOptions(documentNode: gql(_actions.createUser()), variables: {
      "email": emailController.text,
      "password": passwordController.text,
      "referralCode": referralCodeController.text,
      "username": userNameController.text,
      "phonenumber": phoneNumberController.text,
      "currency": selectedCountry.currencyCode,
      "country": selectedCountry.name,
      "phoneNumber": phoneNumberController.text,
      "callingCode": selectedCountry.callingCode,
      "flag": selectedCountry.flag
    });

    var client = QLConfig.getClientWithoutAuth();

    QueryResult result = await client.value.mutate(options);
    if (!result.hasException) {
      response = CreateUserResponse.fromJson(result.data['register']);

      //todo: save data in local storage
      Storage.save('token', response.token);
      Storage.save('username', response.user.username);

      ImageLoader.hide();

      Get.toNamed('/verification');
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

  showPassword() {
    this.isPassword = !this.isPassword;
    update();
  }

  //dispose text controllers after use
  @override
  void onClose() {
    super.onClose();
  }
}
