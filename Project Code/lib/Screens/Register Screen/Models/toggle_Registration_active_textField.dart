
import 'package:flight_booking/Screens/Register%20Screen/Models/register_password_textField.dart';
import 'package:flight_booking/Screens/Register%20Screen/Models/register_with_apple_textField.dart';
import 'package:flight_booking/Screens/Register%20Screen/Models/register_with_email_textField.dart';
import 'package:flight_booking/Screens/Register%20Screen/Models/register_with_facebook_textField.dart';
import 'package:flight_booking/Screens/Register%20Screen/Models/register_with_google_textField.dart';
import 'package:flight_booking/Screens/Register%20Screen/Models/register_with_mobile_textField.dart';
import 'package:flight_booking/Screens/Register%20Screen/Models/toggle_registration_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/password_validator.dart';
import '../Controller/register_screen_controller.dart';

class ToggleRegistrationActiveTextField extends StatelessWidget {
   ToggleRegistrationActiveTextField({Key? key}) : super(key: key);

   final registerScreenController = Get.find<RegisterScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (registerScreenController.registerWith.value ==
            'Email')
            ? SingUpWithEmailTextField()
            : Container(),
        (registerScreenController.registerWith.value ==
            'Mobile')
            ? SingUpWithMobileTextField()
            : Container(),
        (registerScreenController.registerWith.value ==
            'Facebook')
            ? SingUpWithFacebookTextField()
            : Container(),
        (registerScreenController.registerWith.value ==
            'Google')
            ? SingUpWithGoogleTextField()
            : Container(),
        (registerScreenController.registerWith.value ==
            'Apple')
            ? SingUpWithAppleTextField()
            : Container(),
        const SizedBox(
          height: 25.0,
        ),
        PasswordTextField(),
        const SizedBox(
          height: 45.0,
        ),
        PasswordValidator(
          screen: 'RegisterScreen',
        ),
        const SizedBox(
          height: 8.0,
        ),
        divider,
        const SizedBox(
          height: 5.0,
        ),
        Column(
          children: [
            const Text('OR'),
            const SizedBox(
              height: 15.0,
            ),
            ToggleSingUpMethod(),
          ],
        )
      ],
    );
  }
}
