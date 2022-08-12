import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controller/forget_password_controller.dart';


class ForgetPasswordToggleMethod extends StatelessWidget {
   ForgetPasswordToggleMethod({Key? key}) : super(key: key);

   final forgetController = Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (forgetController.verificationMethod.value!='Mobile')?GestureDetector(
            child: const Icon(
              FontAwesomeIcons.mobile,
              color: Color(0xFF377D71),
              size: 40.0,
            ),
            onTap: (){
              forgetController.updateVerificationMethod('Mobile');
            },
          ):GestureDetector(
            child: const Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF826F66),
              size: 40.0,
            ),
            onTap: (){
              forgetController.updateVerificationMethod('Email');
            },
          ),
          const SizedBox(
            width: 15.0,
          ),
          (forgetController.verificationMethod.value!='Facebook')?GestureDetector(
            child: const Icon(
              FontAwesomeIcons.facebook,
              color: Color(0xFF000080),
              size: 40.0,
            ),
            onTap: (){
              forgetController.updateVerificationMethod('Facebook');
            },
          ):GestureDetector(
            child: const Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF826F66),
              size: 40.0,
            ),
            onTap: (){
              forgetController.updateVerificationMethod('Email');
            },
          ),
          const SizedBox(
            width: 15.0,
          ),
          (forgetController.verificationMethod.value!='Google')?GestureDetector(
            child: const Icon(
              FontAwesomeIcons.google,
              color: Color(0xCCB70000),
              size: 40.0,
            ),
            onTap: (){
              forgetController.updateVerificationMethod('Google');
            },
          ):GestureDetector(
            child: const Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF826F66),
              size: 40.0,
            ),
            onTap: (){
              forgetController.updateVerificationMethod('Email');
            },
          ),
          const SizedBox(
            width: 15.0,
          ),
          (forgetController.verificationMethod.value!='Apple')?GestureDetector(
            child: const Icon(
              FontAwesomeIcons.apple,
              color: Color(0xFF323232),
              size: 40.0,
            ),
            onTap: (){
              forgetController.updateVerificationMethod('Apple');
            },
          ):GestureDetector(
            child: const Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF826F66),
              size: 40.0,
            ),
            onTap: (){
              forgetController.updateVerificationMethod('Email');
            },
          )
        ],
      ),
    );
  }
}
