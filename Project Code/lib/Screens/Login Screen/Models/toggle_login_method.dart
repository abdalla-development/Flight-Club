import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controller/login_screen_controller.dart';

class ToggleSingInRegisterMethod extends StatelessWidget {
   ToggleSingInRegisterMethod({Key? key}) : super(key: key);

  final singInMethod = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (singInMethod.singWith.value!='Mobile')?GestureDetector(
            child: const Icon(
              FontAwesomeIcons.mobile,
              color: Color(0xFF377D71),
              size: 40.0,
            ),
            onTap: (){
              singInMethod.updateSingWith('Mobile');
            },
          ):GestureDetector(
            child: const Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF826F66),
              size: 40.0,
            ),
            onTap: (){
              singInMethod.updateSingWith('Email');
            },
          ),
          const SizedBox(
            width: 15.0,
          ),
          (singInMethod.singWith.value!='Facebook')?GestureDetector(
            child: const Icon(
              FontAwesomeIcons.facebook,
              color: Color(0xFF000080),
              size: 40.0,
            ),
            onTap: (){
              singInMethod.updateSingWith('Facebook');
            },
          ):GestureDetector(
            child: const Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF826F66),
              size: 40.0,
            ),
            onTap: (){
              singInMethod.updateSingWith('Email');
            },
          ),
          const SizedBox(
            width: 15.0,
          ),
          (singInMethod.singWith.value!='Google')?GestureDetector(
            child: const Icon(
              FontAwesomeIcons.google,
              color: Color(0xCCB70000),
              size: 40.0,
            ),
            onTap: (){
              singInMethod.updateSingWith('Google');
            },
          ):GestureDetector(
            child: const Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF826F66),
              size: 40.0,
            ),
            onTap: (){
              singInMethod.updateSingWith('Email');
            },
          ),
          const SizedBox(
            width: 15.0,
          ),
          (singInMethod.singWith.value!='Apple')?GestureDetector(
            child: const Icon(
              FontAwesomeIcons.apple,
              color: Color(0xFF323232),
              size: 40.0,
            ),
            onTap: (){
              singInMethod.updateSingWith('Apple');
            },
          ):GestureDetector(
            child: const Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF826F66),
              size: 40.0,
            ),
            onTap: (){
              singInMethod.updateSingWith('Email');
            },
          )
        ],
      ),
    );
  }
}
