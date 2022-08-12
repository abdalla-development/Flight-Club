import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeMyPasswordController extends GetxController{
  final obscureText = true.obs;
  final password1 = ''.obs;
  final password1LabelText = ''.obs;
  final password2 = ''.obs;
  final password2LabelText = ''.obs;
  final passwordIsValid = false.obs;
  final showLoadingSpinner = false.obs;

  final  passwordController = TextEditingController();
  final  passwordController1 = TextEditingController();

  void toggleObscureText(){
    obscureText.value = !obscureText.value;
  }

  void updatePassword1(String value){
    password1.value = value;
  }

  void updatePassword1LabelText(String value){
    password1LabelText.value = value;
  }

  void updatePassword2(String value){
    password2.value = value;
  }

  void updatePassword2LabelText(String value){
    password2LabelText.value = value;
  }

  void togglePasswordIsValid(bool value){
    passwordIsValid.value =  value;
  }

  void toggleShowLoadingSpinner(){
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }
}