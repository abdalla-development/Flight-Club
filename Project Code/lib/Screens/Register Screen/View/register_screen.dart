import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Functions/email_validation.dart';
import '../../../Utilities/Methods/Register/register_with_apple.dart';
import '../../../Utilities/Methods/Register/register_with_email.dart';
import '../../../Utilities/Methods/Register/register_with_facebook.dart';
import '../../../Utilities/Methods/Register/register_with_google.dart';
import '../../../Utilities/Methods/Register/register_with_mobile.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controller/register_screen_controller.dart';
import '../Models/toggle_Registration_active_textField.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final registerScreenController = Get.put(RegisterScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(
                leadingIcon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black54,),
                title: '',
                usingTitle: false,
              onPressed: (){
                  Get.back();
                  },
            ),
            body: Container(
              decoration: kAppBackgroundColor,
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      Text(
                        'SIGN UP',
                        style: GoogleFonts.lobster(
                          fontSize: 40.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Expanded(
                        flex: 5,
                        child: ToggleRegistrationActiveTextField(),
                      ),
                      ElevatedButton(
                        style: kElevationButtonStyle,
                        onPressed: () {
                          registerScreenController.toggleLoadingSpinner();
                          emailValidate('RegisterScreen');
                          if (registerScreenController.registerWith.value ==
                              'Email') {
                            (registerScreenController.emailIsValid.value &&
                                    registerScreenController
                                        .passwordIsValid.value)
                                ? registerWithEmail()
                                : null;
                          } else if (registerScreenController
                                  .registerWith.value ==
                              'Mobile') {
                            (registerScreenController.mobileIsValid.value &&
                                    registerScreenController
                                        .passwordIsValid.value)
                                ? registerWithMobile()
                                : null;
                          } else if (registerScreenController
                                  .registerWith.value ==
                              'Facebook') {
                            (registerScreenController.mobileIsValid.value &&
                                    registerScreenController
                                        .passwordIsValid.value)
                                ? registerWithFacebook()
                                : null;
                          } else if (registerScreenController
                                  .registerWith.value ==
                              'Google') {
                            (registerScreenController.mobileIsValid.value &&
                                    registerScreenController
                                        .passwordIsValid.value)
                                ? registerWithGoogle()
                                : null;
                          } else if (registerScreenController
                                  .registerWith.value ==
                              'Apple') {
                            (registerScreenController.mobileIsValid.value &&
                                    registerScreenController
                                        .passwordIsValid.value)
                                ? registerWithApple()
                                : null;
                          }
                        },
                        child: const Text(
                          'Register',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          (registerScreenController.showLoadingSpinner.value)
              ? const Spinner()
              : Container(),
        ],
      ),
    );
  }
}
