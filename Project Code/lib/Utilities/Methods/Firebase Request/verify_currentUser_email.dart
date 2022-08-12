import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/Utilities/Methods/Functions/success_snackBar_message.dart';
import 'package:get/get.dart';
import '../../../Screens/Settings Screen/Controller/settings_screen_controller.dart';
import '../Functions/error_snackBar_message.dart';

User? user = FirebaseAuth.instance.currentUser;
final settingsController = Get.find<SettingsScreenController>();

void verifyCurrentUserEmail() async{

  settingsController.toggleLoadingSpinner();
  try{
    await user?.sendEmailVerification();
    showSuccessSnackBarMessage(
        message: 'A Verification Email Had Been Sent',
        title: 'Successful',
    );
  }catch(e){
    showErrorSnackBarMessage(
        message: 'Sorry We Could Not Send A Verification Email Had Been Sent',
        title: 'Error',
    );
  }
  settingsController.toggleLoadingSpinner();
}