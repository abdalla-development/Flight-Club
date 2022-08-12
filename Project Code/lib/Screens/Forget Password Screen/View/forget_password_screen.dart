import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Methods/Functions/email_validation.dart';
import '../../../Utilities/Methods/Firebase Request/send_forgot _password_reset_email.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controller/forget_password_controller.dart';
import '../Models/forget_password_apple_textField.dart';
import '../Models/forget_password_email_textField.dart';
import '../Models/forget_password_facebook_textField.dart';
import '../Models/forget_password_google_textField.dart';
import '../Models/forget_password_mobile_textField.dart';
import '../Models/forget_password_toggle_method.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final forgetController = Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          body: Container(
            decoration: kAppBackgroundColor,
            child: SafeArea(
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: kContainerColor,
                      ),
                      child: Obx(
                        () => Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  child: const Icon(FontAwesomeIcons.arrowLeft),
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 80,
                              child: Image(
                                image: AssetImage(
                                    'Images/ForgetPasswordScreen/forget_my_password_icon.png'),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            (forgetController.verificationMethod.value == 'Email')
                                ? ForgetPasswordEmailTextField()
                                : Container(),
                            (forgetController.verificationMethod.value == 'Mobile')
                                ? ForgetPasswordMobileTextField()
                                : Container(),
                            (forgetController.verificationMethod.value ==
                                    'Facebook')
                                ? ForgetPasswordFacebookTextField()
                                : Container(),
                            (forgetController.verificationMethod.value == 'Google')
                                ? ForgetPasswordGoogleTextField()
                                : Container(),
                            (forgetController.verificationMethod.value == 'Apple')
                                ? ForgetPasswordAppleTextField()
                                : Container(),
                            const SizedBox(
                              height: 25.0,
                            ),
                            ForgetPasswordToggleMethod(),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff22577E),
                                  onPrimary: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  minimumSize: const Size(250, 40), //////// HERE
                                ),
                                onPressed: () {
                                  emailValidate('ForgetPasswordScreen');
                                  if (forgetController.emailIsValid.value){
                                    sendPasswordResetEmail();
                                  }else{
                                    forgetController.updateRetrieveEmailLabelText('You Need To Provide A Valid Email');
                                  }
                                },
                                child: const Text(
                                  'Reset Password',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        (forgetController.showLoadingSpinner.value) ? const Spinner() : Container(),
      ],
    );
  }
}
