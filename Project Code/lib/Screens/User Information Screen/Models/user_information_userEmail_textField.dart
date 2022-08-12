import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/user_information_screen_controller.dart';

class UserInformationEmailTextField extends StatelessWidget {
  UserInformationEmailTextField({Key? key}) : super(key: key);

  final userInfoController = Get.find<UserInformationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon: const Icon(FontAwesomeIcons.envelope),
          hintText: 'Please Enter Your Email Address',
          labelText: (userInfoController.userEmail.value == '')?null:userInfoController.userEmail.value,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        onChanged: (value) {
          if (value!=''){
            userInfoController.updateUserEmailAddress(value);
          }
        },
        keyboardType: TextInputType.number,
      ),
    );
  }
}
