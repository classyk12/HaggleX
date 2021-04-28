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
  QueryMutation _actions = QueryMutation();
  bool isPassword = true;

  void onInit() {
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    referralCodeController = new TextEditingController();
    phoneNumberController = new TextEditingController();
    userNameController = new TextEditingController();
    selectedCountry = DashBoardMockClass.getDefaultValue();

    super.onInit();
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
