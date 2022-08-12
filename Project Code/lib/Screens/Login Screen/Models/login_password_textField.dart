import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/login_screen_controller.dart';

class LoginPasswordTextField extends StatelessWidget {
   LoginPasswordTextField({Key? key}) : super(key: key);

   final singingIn = Get.find<LoginScreenController>();

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
              singingIn.togglePasswordObscure();
            },
          ),
          labelText: (singingIn.passwordLabelText.value == '')
              ? null
              : singingIn.passwordLabelText.value,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        obscureText: singingIn.obscureText.value,
        onChanged: (value) {
          singingIn.updatePasswordLabelText('');
          singingIn.updatePassword(value);
          if(value==''){
            singingIn.updatePasswordIsNull(false);
          }else{
            singingIn.updatePasswordIsNull(true);
          }
        },
      ),
    );
  }
}
