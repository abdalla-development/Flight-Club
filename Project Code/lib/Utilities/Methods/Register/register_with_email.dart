import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/Utilities/Methods/Functions/success_snackBar_message.dart';
import 'package:get/get.dart';
import '../../../Screens/Register Screen/Controller/register_screen_controller.dart';
import '../Functions/error_snackBar_message.dart';

final registerMethod = Get.find<RegisterScreenController>();

void registerWithEmail() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: registerMethod.userID.value,
            password: registerMethod.password.value);
    registerMethod.toggleLoadingSpinner();
    showSuccessSnackBarMessage(
        message: 'You Account Has Being Created',
        title: 'Registration Successfully');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      registerMethod.toggleLoadingSpinner();
      showErrorSnackBarMessage(
          message: 'Sorry! But The Email Already Exists Try To Login Instead',
          title: 'Registration Unsuccessful');
    }
  } catch (e) {
    print(e);
  }
  Get.offNamed('/LoginScreen');
}
