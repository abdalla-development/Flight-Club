import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../Screens/Register Screen/Controller/register_screen_controller.dart';

final registerMethod = Get.find<RegisterScreenController>();


void registerWithGoogle() async {

  // try {
  //   UserCredential userCredential = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: registerMethod.userID.value, password: registerMethod.password.value);
  //   registerMethod.toggleLoadingSpinner();
  //   Get.snackbar(
  //     'Registered Successfully',
  //     'You Account Has Being Created',
  //   );
  //   Get.offNamed('/LoginScreen');
  // } on FirebaseAuthException catch (e) {
  //   if (e.code == 'email-already-in-use') {
  //     registerMethod.toggleLoadingSpinner();
  //     Get.snackbar(
  //       'Registered Unsuccessful',
  //       'Sorry! But The Email Already Exists',
  //     );
  //   }
  // } catch (e) {
  //   print(e);
  // }

}