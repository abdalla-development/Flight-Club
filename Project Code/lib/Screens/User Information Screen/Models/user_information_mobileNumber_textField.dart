import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/user_information_screen_controller.dart';

class UserInformationMobileTextField extends StatelessWidget {
  UserInformationMobileTextField({Key? key}) : super(key: key);

  final userInfoController = Get.find<UserInformationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> TextField(
            decoration: kTextFieldDecoration.copyWith(
              prefixIcon: const Icon(FontAwesomeIcons.mobile),
              hintText: 'Please Enter Your Mobile Number',
              labelText: (userInfoController.userMobileLabel.value == '')?null:userInfoController.userMobileLabel.value,
              labelStyle: const TextStyle(
                color: Colors.red,
              ),
            ),
            onChanged: (value) {
              if (value!=''){
                userInfoController.updateUserMobileNumber(value); 
              }
            },
            keyboardType: TextInputType.number,
          ),
    );
  }
}
