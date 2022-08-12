import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForgetPassword extends StatelessWidget {
  const LoginForgetPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text(
        'Forget Your Password',
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 20.0,
          // color: kMainTextColor,
        ),
      ),
      onTap: () {
        Get.toNamed('/ForgetPasswordScreen');
      },
    );
  }
}
