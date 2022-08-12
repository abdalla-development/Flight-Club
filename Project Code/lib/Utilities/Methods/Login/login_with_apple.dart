import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Screens/Login Screen/Controller/login_screen_controller.dart';

final loginMethod = Get.find<LoginScreenController>();

void signInWithApple() async {
  //
  // try{
  //   UserCredential userCredential = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: loginMethod.userID.value, password: loginMethod.password.value);
  //   getCurrentUser(screen: 'LoginScreen');
  //   final snapShot = await FirebaseFirestore.instance.collection('Users')
  //       .doc(loginMethod.currentLoggedInUser.value).get();
  //   loginMethod.toggleLoadingSpinner();
  //   if (snapShot.exists) {
  //     // User Had Provided His Information already
  //     Get.offNamed('/HomeScreen');
  //   } else {
  //     // User Had Not Provided His Information Yet
  //     Get.offNamed('/UserInformationScreen');
  //   }
  // }
  // on FirebaseAuthException catch (e){
  //   if (e.code == 'user-not-found'){
  //     loginMethod.toggleLoadingSpinner();
  //     Get.snackbar(
  //       '',
  //       'Sorry! Try To Register First',
  //       titleText: const Text('User Not Found', style: TextStyle(color: Colors.red),),
  //       borderRadius: 20,
  //       margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
  //       // backgroundColor: ,
  //       // backgroundGradient: ,
  //       borderColor: Colors.blueGrey,
  //       borderWidth: 2,
  //       duration: const Duration(milliseconds: 3000),
  //       icon: const Icon(FontAwesomeIcons.circleXmark, color: Colors.red,),
  //     );
  //     Get.toNamed('/RegisterScreen');
  //   }else if (e.code == 'wrong-password'){
  //     loginMethod.toggleLoadingSpinner();
  //     Get.snackbar(
  //       '',
  //       'Sorry! The Password You Entered Wrong Password',
  //       titleText: const Text('Invalid Credentials', style: TextStyle(color: Colors.red),),
  //       borderRadius: 20,
  //       margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
  //       // backgroundColor: ,
  //       // backgroundGradient: ,
  //       borderColor: Colors.blueGrey,
  //       borderWidth: 2,
  //       duration: const Duration(milliseconds: 3000),
  //       icon: const Icon(FontAwesomeIcons.circleXmark, color: Colors.red,),
  //     );
  //   }
  // }
}
