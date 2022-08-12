import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final showLoadingSpinner = false.obs;
  final singWith = 'Email'.obs;
  final userID = 'Email'.obs;
  final userIDLabelText = ''.obs;
  final password = ''.obs;
  final passwordLabelText = ''.obs;
  final emailIsValid = false.obs;
  final passwordIsNull = false.obs;
  final obscureText = true.obs;
  final currentLoggedInUser = ''.obs;
  final userAvatarPath = ''.obs;

  void updateSingWith(String selected) {
    userID.value = '';
    userIDLabelText.value = '';
    password.value = '';
    passwordLabelText.value = '';
    singWith.value = selected;
  }

  void updateLoginEmailIsValid(bool value) {
    emailIsValid.value = value;
    if (value == false) {
      if (singWith.value == 'Email') {
        userIDLabelText.value = 'The Email You Entered Is Not Valid';
      } else if (singWith.value == 'Mobile') {
        userIDLabelText.value = 'The Mobile You Entered Is Not Valid';
      } else if (singWith.value == 'Facebook') {
        userIDLabelText.value =
            'The Facebook Username You Entered Is Not Valid';
      } else if (singWith.value == 'Google') {
        userIDLabelText.value = 'The Google Username You Entered Is Not Valid';
      } else if (singWith.value == 'Apple') {
        userIDLabelText.value = 'The Apple Username You Entered Is Not Valid';
      }
    }
  }

  void updateUserIDLabelText(String value) {
    userIDLabelText.value = value;
  }

  void updateUserID(String value) {
    userID.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  void updatePasswordLabelText(String value) {
    passwordLabelText.value = value;
  }

  void togglePasswordObscure() {
    obscureText.value = !obscureText.value;
  }

  void toggleLoadingSpinner() {
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void updatePasswordIsNull(bool value) {
    passwordIsNull.value = value;
  }

  void updateCurrentLoggedInUser(String value) {
    currentLoggedInUser.value = value;
  }

  void loadUserAvatarPath(String value) {
    userAvatarPath.value = value;
  }
}
