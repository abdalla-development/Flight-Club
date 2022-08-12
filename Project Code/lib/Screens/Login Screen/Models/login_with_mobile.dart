import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/login_screen_controller.dart';

class LoginWithMobilTextField extends StatelessWidget {
   LoginWithMobilTextField({Key? key}) : super(key: key);

   final singingIn = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon:
          const Icon(FontAwesomeIcons.mobile),
          hintText: 'Please Enter Your Mobile Number',
          labelText: (singingIn.userIDLabelText.value == '')
              ? null
              : singingIn.userIDLabelText.value,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          singingIn.updateUserIDLabelText('');
          singingIn.updateUserID(value);
        },
      ),
    );
  }
}
