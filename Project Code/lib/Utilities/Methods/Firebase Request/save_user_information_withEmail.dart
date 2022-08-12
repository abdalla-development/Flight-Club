import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_booking/Utilities/Methods/Functions/success_snackBar_message.dart';
import 'package:get/get.dart';
import '../../../Screens/User Information Screen/Controller/user_information_screen_controller.dart';
import '../Functions/error_snackBar_message.dart';
import '../Functions/get_current_user.dart';

final userInfoController = Get.find<UserInformationController>();
final CollectionReference users =
    FirebaseFirestore.instance.collection('Users');

void saveUserInformationEmail() async {
  final userInfo = <String, String>{
    'First Name': userInfoController.firstName.value,
    'Last Name': userInfoController.lastName.value,
    'Username': userInfoController.username.value,
    'Gender': userInfoController.genderType.value,
    'Mobile Number': userInfoController.userMobileNumber.value,
  };

  getCurrentUser(screen: 'UserInformationScreen');

  if (userInfoController.firstName.value != '' &&
      userInfoController.lastName.value != '' &&
      userInfoController.username.value != '' &&
      userInfoController.genderType.value != '' &&
      userInfoController.userMobileNumber.value != '') {
    try {
      await users
          .doc(userInfoController.currentLoggedInUser.value)
          .set(userInfo)
          .onError((e, _) => showErrorSnackBarMessage(
              message: 'Sorry! Something Went Wrong',
              title: 'Saving Unsuccessful'))
          .then((value) => showSuccessSnackBarMessage(
              title: 'Saving Successfully',
              message: 'Your Information Has Being Added'));
      userInfoController.toggleLoadingSpinner();
      Get.toNamed('/HomeScreen');
    } catch (e) {
      print(e);
    }
  }
}
