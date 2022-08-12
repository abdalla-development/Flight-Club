import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';
import '../../Screens/Change Password Screen/Controller/change_password_controller.dart';
import '../../Screens/Register Screen/Controller/register_screen_controller.dart';

class PasswordValidator extends StatelessWidget {
  PasswordValidator({Key? key, required  this.screen}) : super(key: key);

  final registration = Get.put(RegisterScreenController());
  final changePassword = Get.put(ChangeMyPasswordController());
  final String screen;

  @override
  Widget build(BuildContext context) {
    return FlutterPwValidator(
      controller: (screen == 'RegisterScreen')
          ? registration.passwordController
          : changePassword.passwordController,
      failureColor: const Color(0xffB22727),
      successColor: const Color(0xff243D25),
      minLength: 6,
      uppercaseCharCount: 2,
      numericCharCount: 3,
      specialCharCount: 1,
      width: 400,
      height: 150,
      onSuccess: () {
        (screen == 'RegisterScreen')
            ? registration.togglePasswordIsValid(true)
            : changePassword.togglePasswordIsValid(true);
      },
      onFail: () {
        (screen == 'RegisterScreen')
            ? registration.togglePasswordIsValid(false)
            : changePassword.togglePasswordIsValid(false);
      },
    );
  }
}
