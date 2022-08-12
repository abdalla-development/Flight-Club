import 'package:flutter/material.dart';
import 'otp_input.dart';

class OTPInputFields extends StatelessWidget {
   OTPInputFields({required this.controllerField4, required this.controllerField3, required this.controllerField2, required this.controllerField1});

  final TextEditingController controllerField1;
  final TextEditingController controllerField2;
  final TextEditingController controllerField3;
  final TextEditingController controllerField4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OtpInput(controllerField1, true),
        const SizedBox(
          width: 5.0,
        ),
        OtpInput(controllerField2, false),
        const SizedBox(
          width: 5.0,
        ),
        OtpInput(controllerField3, false),
        const SizedBox(
          width: 5.0,
        ),
        OtpInput(controllerField4, false)
      ],
    );
  }
}
