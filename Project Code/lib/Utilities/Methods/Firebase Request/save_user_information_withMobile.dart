import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Screens/User Information Screen/Controller/user_information_screen_controller.dart';
import '../Functions/get_current_user.dart';

final userInfoController = Get.find<UserInformationController>();
final CollectionReference users = FirebaseFirestore.instance.collection('Users');

void saveUserInformationMobile() async {
  final userInfo = <String, String>{
    'First Name': userInfoController.firstName.value,
    'Last Name': userInfoController.lastName.value,
    'Username': userInfoController.username.value,
    'Gender': userInfoController.genderType.value,
    'Mobile Number': userInfoController.userMobileNumber.value,
  };

  getCurrentUser(screen: 'UserInformationScreen');

  if(userInfoController.firstName.value != '' &&
      userInfoController.lastName.value != '' &&
      userInfoController.username.value != '' &&
      userInfoController.genderType.value != '' &&
      userInfoController.userMobileNumber.value != ''){
    // try {
    //   await users.doc(userInfoController.currentLoggedInUser.value).set(userInfo)
    //       .onError((e, _) =>
    //       Get.snackbar(
    //         '',
    //         'Sorry! Something Went Wrong',
    //         titleText: const Text('Saving Unsuccessful', style: TextStyle(color: Colors.red),),
    //         borderRadius: 20,
    //         margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
    //         // backgroundColor: ,
    //         // backgroundGradient: ,
    //         borderColor: Colors.blueGrey,
    //         borderWidth: 2,
    //         duration: const Duration(milliseconds: 3000),
    //         icon: const Icon(FontAwesomeIcons.circleXmark, color: Colors.red,),
    //       )
    //   )
    //       .then((value) =>
    //       Get.snackbar(
    //         '',
    //         'Your Information Has Being Added',
    //         titleText: const Text('Saving Successfully', style: TextStyle(color: Colors.green),),
    //         borderRadius: 20,
    //         margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
    //         // backgroundColor: ,
    //         // backgroundGradient: ,
    //         borderColor: Colors.blueGrey,
    //         borderWidth: 2,
    //         duration: const Duration(milliseconds: 3000),
    //         icon: const Icon(FontAwesomeIcons.checkCircle, color: Colors.green,),
    //       )
    //   );
    //   userInfoController.toggleLoadingSpinner();
    //   Get.toNamed('/HomeScreen');
    // } catch (e) {
    //   print(e);
    // }
  }
}
