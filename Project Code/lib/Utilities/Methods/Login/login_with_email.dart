import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../Screens/Login Screen/Controller/login_screen_controller.dart';
import '../Functions/error_snackBar_message.dart';
import '../Functions/get_current_user.dart';

final loginMethod = Get.find<LoginScreenController>();

void signInWithEmail() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: loginMethod.userID.value,
            password: loginMethod.password.value);
    getCurrentUser(screen: 'LoginScreen');
    final snapShot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(loginMethod.currentLoggedInUser.value)
        .get();
    loginMethod.toggleLoadingSpinner();
    if (snapShot.exists) {
      // User Had Provided His Information already
      Get.offNamed('/HomeScreen');
    } else {
      // User Had Not Provided His Information Yet
      Get.offNamed('/UserInformationScreen');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      loginMethod.toggleLoadingSpinner();
      showErrorSnackBarMessage(
          message: 'Sorry! Try To Register First', title: 'User Not Found');
      Get.toNamed('/RegisterScreen');
    } else if (e.code == 'wrong-password') {
      loginMethod.toggleLoadingSpinner();
      showErrorSnackBarMessage(
          message: 'Sorry! The Password You Entered Wrong Password',
          title: 'Invalid Credentials');
    }
  }
}
