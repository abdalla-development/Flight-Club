import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/Utilities/Methods/Functions/success_snackBar_message.dart';
import '../Login/login_with_email.dart';
import 'error_snackBar_message.dart';

void changeUserPassword () async{
  signInWithEmail();
  final user = FirebaseAuth.instance.currentUser;

  try{
    await user?.updatePassword('newPassword');
    showSuccessSnackBarMessage(
        message: 'Password Has Been Updated Successfully',
        title: 'Password Updated',
    );
  }on FirebaseAuthException catch(e){
    showErrorSnackBarMessage(
      message: e.toString(),
      title: 'Password Not Changed',
    );
  }
}