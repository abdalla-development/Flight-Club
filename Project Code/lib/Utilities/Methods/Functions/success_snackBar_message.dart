
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


void showSuccessSnackBarMessage ({required String title, required String message}){
  Get.snackbar(
    '',
    message,
    titleText:  Text(title, style: const TextStyle(color: Colors.green),),
    borderRadius: 20,
    margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
    // backgroundColor: ,
    // backgroundGradient: ,
    borderColor: Colors.blueGrey,
    borderWidth: 2,
    duration: const Duration(milliseconds: 3000),
    icon: const Icon(FontAwesomeIcons.checkCircle, color: Colors.green,),
  );
}