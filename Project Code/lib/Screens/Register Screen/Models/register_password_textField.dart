import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/register_screen_controller.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({Key? key}) : super(key: key);

  final registration = Get.find<RegisterScreenController>();

  @override
  Widget build(BuildContext context) {

    return Obx(
        ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon: const Icon(FontAwesomeIcons.lock),
          hintText: 'Please Enter A Password',
          suffix: GestureDetector(
            child: const Icon(Icons.visibility),
            onTap: () {
              registration.togglePasswordObscure();
            },
          ),
          labelText:(registration.passwordIsValid.value)? null : registration.passwordLabelText.value,
          labelStyle: const TextStyle(color: Colors.red),
        ),
        controller: registration.passwordController,
        obscureText: registration.obscureText.value,
        onChanged: (value) {
          registration.updatePassword(value);
          registration.updatePasswordLabelText('');
        },
      ),
    );
  }
}
