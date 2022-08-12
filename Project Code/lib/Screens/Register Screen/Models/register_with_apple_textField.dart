import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/register_screen_controller.dart';

class SingUpWithAppleTextField extends StatelessWidget {
   SingUpWithAppleTextField({Key? key}) : super(key: key);

  final registration = Get.find<RegisterScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon:
          const Icon(FontAwesomeIcons.apple),
          hintText: 'Please Enter Your icloud account username',
          labelText: (registration.emailIsValid.value)?null: registration.userIDLabelText.value,
          labelStyle: const TextStyle(color: Colors.red),
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          registration.updateUserIDLabelText('');
          registration.updateUserID(value);
        },
      ),
    );
  }
}
