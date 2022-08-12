import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/user_information_screen_controller.dart';

class UserInformationFirstNameTextField extends StatelessWidget {
   UserInformationFirstNameTextField({Key? key}) : super(key: key);

   final userInfoController = Get.find<UserInformationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon: const Icon(FontAwesomeIcons.f),
          hintText: 'Please Enter Your First Name',
          labelText: (userInfoController.firstNameLabel.value == '')?null:userInfoController.firstNameLabel.value,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        onChanged: (value) {
          if (value!=''){
            userInfoController.updateFirstName(value);
          }
        },
      ),
    );
  }
}
