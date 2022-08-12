import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Functions/email_validation.dart';
import '../../../Utilities/Methods/Login/login_with_email.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controller/login_screen_controller.dart';
import '../Models/toggle_login_active_textField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final loginScreenController = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            body: Container(
              decoration: kAppBackgroundColor,
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      Text(
                        'SIGN IN',
                        style: GoogleFonts.lobster(
                          fontSize: 40.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const Expanded(
                        flex: 5,
                        child: ToggleLoginActiveTextField(),
                      ),
                      ElevatedButton(
                        style: kElevationButtonStyle,
                        onPressed: () {
                          loginScreenController.toggleLoadingSpinner();
                          emailValidate('LoginScreen');
                          if (loginScreenController.singWith.value == 'Email') {
                            (loginScreenController.emailIsValid.value &&
                                    loginScreenController.passwordIsNull.value)
                                ? signInWithEmail()
                                : null;
                          } else if (loginScreenController.singWith.value ==
                              'Mobile') {
                          } else if (loginScreenController.singWith.value ==
                              'Google') {
                          } else if (loginScreenController.singWith.value ==
                              'Facebook') {
                          } else {}
                        },
                        child: const Text(
                          'Log In',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          (loginScreenController.showLoadingSpinner.value)
              ? const Spinner()
              : Container(),
        ],
      ),
    );
  }
}
