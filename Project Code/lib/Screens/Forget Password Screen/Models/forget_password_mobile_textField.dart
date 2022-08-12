import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/forget_password_controller.dart';

class ForgetPasswordMobileTextField extends StatelessWidget {
  ForgetPasswordMobileTextField({Key? key}) : super(key: key);

  final forgetController = Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon:
          const Icon(FontAwesomeIcons.envelope),
          hintText: 'Please Enter Your Mobile Number',
          labelText: (forgetController.retrieveEmailLabelText.value == '')
              ? null
              : forgetController.retrieveEmailLabelText.value,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          forgetController.retrieveEmailLabelText('');
          forgetController.retrieveEmail(value);
        },
      ),
    );
  }
}
