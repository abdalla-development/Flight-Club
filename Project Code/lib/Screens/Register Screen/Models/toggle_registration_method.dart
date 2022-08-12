import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controller/register_screen_controller.dart';

class ToggleSingUpMethod extends StatelessWidget {
   ToggleSingUpMethod({
    Key? key,}) : super(key: key);

  final registerMethod = Get.find<RegisterScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (registerMethod.registerWith.value.toString()!='Mobile')
            ? GestureDetector(
          child: const Icon(
            FontAwesomeIcons.mobile,
            color: Color(0xFF377D71),
            size: 40.0,
          ),
          onTap: () {
            registerMethod.updateRegisterWith('Mobile');
          },
        )
            : GestureDetector(
          child: const Icon(
            FontAwesomeIcons.envelope,
            color: Color(0xFF826F66),
            size: 45.0,
          ),
          onTap: () {
            registerMethod.updateRegisterWith('Email');
          },
        ),
        const SizedBox(
          width: 30.0,
        ),
        (registerMethod.registerWith.value.toString()!='Facebook')
            ? GestureDetector(
          child: const Icon(
            FontAwesomeIcons.facebook,
            color: Color(0xFF000080),
            size: 45.0,
          ),
          onTap: () {
            registerMethod.updateRegisterWith('Facebook');
          },
        )
            : GestureDetector(
          child: const Icon(
            FontAwesomeIcons.envelope,
            color: Color(0xFF826F66),
            size: 45.0,
          ),
          onTap: () {
            registerMethod.updateRegisterWith('Email');
          },
        ),
        const SizedBox(
          width: 30.0,
        ),
        (registerMethod.registerWith.value.toString()!='Google')
            ? GestureDetector(
          child: const Icon(
            FontAwesomeIcons.google,
            color: Color(0xCCB70000),
            size: 45.0,
          ),
          onTap: () {
            registerMethod.updateRegisterWith('Google');
          },
        )
            : GestureDetector(
          child: const Icon(
            FontAwesomeIcons.envelope,
            color: Color(0xFF826F66),
            size: 45.0,
          ),
          onTap: () {
            registerMethod.updateRegisterWith('Email');
          },
        ),
        const SizedBox(
          width: 30.0,
        ),
        (registerMethod.registerWith.value.toString()!='Apple')
            ? GestureDetector(
          child: const Icon(
            FontAwesomeIcons.apple,
            color: Color(0xFF323232),
            size: 45.0,
          ),
          onTap: () {
            registerMethod.updateRegisterWith('Apple');
          },
        )
            : GestureDetector(
          child: const Icon(
            FontAwesomeIcons.envelope,
            color: Color(0xFF826F66),
            size: 45.0,
          ),
          onTap: () {
            registerMethod.updateRegisterWith('Email');
          },
        ),
      ],
    );
  }
}
