import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Functions/change_user_password.dart';
import '../../../Utilities/Models/password_validator.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controller/change_password_controller.dart';

class ChangeMyPasswordScreen extends StatelessWidget {
   ChangeMyPasswordScreen({Key? key}) : super(key: key);

   final changePasswordController = Get.find<ChangeMyPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            body: Container(
              decoration: kAppBackgroundColor,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  margin: const  EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    // color: kContainerColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
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
                              'Images/ChangeMyPasswordScreen/password_changed.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        controller: changePasswordController.passwordController,
                        obscureText: changePasswordController.obscureText.value,
                        onChanged: (value) {
                          changePasswordController.updatePassword1(value);
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          prefixIcon: const Icon(FontAwesomeIcons.lock),
                          hintText: 'Please Enter A Password',
                          labelText:
                          (changePasswordController.password1LabelText.value == '') ? null : changePasswordController.password1LabelText.value,
                          labelStyle: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        controller: changePasswordController.passwordController1,
                        obscureText: changePasswordController.obscureText.value,
                        onChanged: (value) {
                          changePasswordController.updatePassword2(value);
                          // setState(() {
                          //   newPasswordLabel = '';
                          //   newPassword1Label = '';
                          //   newPassword1 = value;
                          // });
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          prefixIcon: const Icon(FontAwesomeIcons.lock),
                          hintText: 'Please Enter A Password',
                          labelText: (changePasswordController.password2LabelText.value == '')
                              ? null
                              : changePasswordController.password2LabelText.value,
                          labelStyle: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          changePasswordController.toggleObscureText();
                        },
                        child: (changePasswordController.obscureText.value)
                            ? const Text(
                          'Show Password ?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            // color: kMainTextColor,
                          ),
                        )
                            : const Text(
                          'Hide Password ?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            // color: kMainTextColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      PasswordValidator(screen: 'ChangeMyPasswordScreen',),
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
                            if (changePasswordController.password1.value==changePasswordController.password2.value){
                              (changePasswordController.passwordIsValid.value)? changeUserPassword() : null ;
                            }
                            },
                          child: const Text(
                            'Save Password',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          (changePasswordController.showLoadingSpinner.value) ? const Spinner() : Container(),
        ],
      ),
    );
  }
}
