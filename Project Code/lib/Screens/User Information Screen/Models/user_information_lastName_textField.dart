import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/user_information_screen_controller.dart';

class UserInformationLastNameTextField extends StatelessWidget {
  UserInformationLastNameTextField({Key? key}) : super(key: key);

  final userInfoController = Get.find<UserInformationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon: const Icon(FontAwesomeIcons.l),
          hintText: 'Please Enter Your Last Name',
          labelText: (userInfoController.lastNameLabel.value == '')?null:userInfoController.lastNameLabel.value,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        onChanged: (value) {
          if (value!=''){
            userInfoController.updateLastName(value);
          }
        },
      ),
    );
  }
}
