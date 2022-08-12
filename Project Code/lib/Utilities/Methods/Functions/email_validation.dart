import 'package:get/get.dart';
import '../../../Screens/Forget Password Screen/Controller/forget_password_controller.dart';
import '../../../Screens/Login Screen/Controller/login_screen_controller.dart';
import '../../../Screens/Register Screen/Controller/register_screen_controller.dart';
import 'package:email_validator/email_validator.dart';

final registration = Get.find<RegisterScreenController>();
final singingIn = Get.find<LoginScreenController>();
final forgetPassword = Get.find<ForgetPasswordController>();

void emailValidate(String screen) {
  bool emailIsValid = false;
  if (screen == 'LoginScreen'){
    emailIsValid = EmailValidator.validate(singingIn.userID.value.toString());
    singingIn.updateLoginEmailIsValid(emailIsValid);
  }else if (screen == 'RegisterScreen'){
    emailIsValid = EmailValidator.validate(registration.userID.value.toString());
    registration.updateRegisterEmailIsValid(emailIsValid);
  }else if (screen == 'ForgetPasswordScreen'){
    emailIsValid = EmailValidator.validate(forgetPassword.retrieveEmail.value.toString());
    forgetPassword.updateEmailIsValid(emailIsValid);
  }
}