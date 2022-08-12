import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../Screens/Home Screen/Controllers/home_screen_controller.dart';
import '../../../Screens/Login Screen/Controller/login_screen_controller.dart';
import '../../../Screens/User Information Screen/Controller/user_information_screen_controller.dart';
import 'error_snackBar_message.dart';

String currentLoggedInUser = '';
final userInfo = Get.find<UserInformationController>();
final login = Get.find<LoginScreenController>();
final homeScreen = Get.find<HomeScreenController>();

void getCurrentUser({required String screen}) async {
  try {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      currentLoggedInUser = currentUser.uid;
      homeScreen.loadCurrentUserEmail(currentUser.email.toString());
      if (screen == 'LoginScreen') {
        login.updateCurrentLoggedInUser(currentLoggedInUser);
      } else if (screen == 'UserInformationScreen') {
        userInfo.updateCurrentLoggedInUser(currentLoggedInUser);
      }
    }
  } on FirebaseAuthException catch (e) {
    showErrorSnackBarMessage(
      message: e.toString(),
      title: 'Error',
    );
  }
}
