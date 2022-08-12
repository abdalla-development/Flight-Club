import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/Utilities/Methods/Functions/success_snackBar_message.dart';
import 'package:get/get.dart';
import '../../../Screens/Forget Password Screen/Controller/forget_password_controller.dart';
import '../Functions/error_snackBar_message.dart';

final forgetController = Get.find<ForgetPasswordController>();

void sendPasswordResetEmail() async {

  forgetController.toggleShowLoadingSpinner();
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: forgetController.retrieveEmail.value);
    showSuccessSnackBarMessage
      (message: 'An Email With Rest Link Has Been Sent To The Provided Email',
      title: 'Successful',
    );
  }on FirebaseAuthException catch (e){
    showErrorSnackBarMessage(
      message: e.toString(),
      title: 'Error',
    );
  }
  forgetController.toggleShowLoadingSpinner();
}