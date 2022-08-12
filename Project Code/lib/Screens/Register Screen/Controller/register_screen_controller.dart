import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController{

  final showLoadingSpinner = false.obs;
  final registerWith = 'Email'.obs;
  final  passwordController = TextEditingController();
  final userID = ''.obs;
  final userIDLabelText = ''.obs;
  final password = ''.obs;
  final passwordLabelText = ''.obs;
  final obscureText = true.obs;
  final emailIsValid = false.obs;
  final mobileIsValid = false.obs;
  final passwordIsValid = false.obs;

  void updateRegisterWith (String selected){
    userID.value = '';
    userIDLabelText.value = '';
    password.value = '';
    passwordLabelText.value = '';
    registerWith.value = selected;
  }

  void togglePasswordObscure() {
    obscureText.value = !obscureText.value;
  }

  void updateUserID(String value){
    userID.value = value;
  }

  void updateUserIDLabelText(String value){
    userIDLabelText.value = value;
  }

  void updatePassword(String value){
    password.value = value;
  }

  void updatePasswordLabelText(String value){
    passwordLabelText.value = value;
  }

  void togglePasswordIsValid(bool value){
    passwordIsValid.value = value;
  }

  void updateRegisterEmailIsValid(bool value){
    emailIsValid.value = value;
    if(value==false){
      if(registerWith.value == 'Email'){
        userIDLabelText.value = 'The Email You Entered Is Not Valid';
      }else if(registerWith.value == 'Mobile'){
        userIDLabelText.value = 'The Mobile You Entered Is Not Valid';
      }else if(registerWith.value == 'Facebook'){
        userIDLabelText.value = 'The Facebook Username You Entered Is Not Valid';
      }else if(registerWith.value == 'Google'){
        userIDLabelText.value = 'The Google Username You Entered Is Not Valid';
      }else if(registerWith.value == 'Apple'){
        userIDLabelText.value = 'The Apple Username You Entered Is Not Valid';
      }
    }
  }

  void toggleLoadingSpinner (){
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }
}