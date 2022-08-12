import 'package:flight_booking/Screens/Login%20Screen/Models/toggle_login_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/login_screen_controller.dart';
import 'login_forget_password.dart';
import 'login_password_textField.dart';
import 'login_with_apple.dart';
import 'login_with_email.dart';
import 'login_with_facebook.dart';
import 'login_with_google.dart';
import 'login_with_mobile.dart';

final loginScreenController = Get.find<LoginScreenController>();

class ToggleLoginActiveTextField extends StatelessWidget {
  const ToggleLoginActiveTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (loginScreenController.singWith.value == 'Email')
            ? LoginWithEmailTextField()
            : (loginScreenController.singWith.value ==
            'Mobile')
            ? LoginWithMobilTextField()
            : (loginScreenController.singWith.value ==
            'Facebook')
            ? LoginWithFacebookTextField()
            : (loginScreenController.singWith.value ==
            'Google')
            ? LoginWithGoogleTextField()
            : LoginWithAppleTextField(),
        const SizedBox(
          height: 25.0,
        ),
        LoginPasswordTextField(),
        const SizedBox(
          height: 25.0,
        ),
        ToggleSingInRegisterMethod(),
        const SizedBox(
          height: 25.0,
        ),
        const LoginForgetPassword(),
        const SizedBox(
          height: 25.0,
        ),
        divider,
        const Text('OR'),
        const SizedBox(
          height: 25.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t Have An Account?  ',
              style: TextStyle(
                fontSize: 15.0,
                // color: kMainTextColor,
              ),
            ),
            GestureDetector(
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 18.0,
                  // color: kMainTextColor,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Get.toNamed('/RegisterScreen');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 25.0,
        ),
      ],
    );
  }
}
