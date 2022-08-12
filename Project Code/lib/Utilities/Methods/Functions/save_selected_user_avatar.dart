import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:get/get.dart';
import '../../../Screens/Login Screen/Controller/login_screen_controller.dart';
import 'error_snackBar_message.dart';

final loginScreenController = Get.find<LoginScreenController>();

void saveSelectedUserAvatar() async{
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  File file = File(loginScreenController.userAvatarPath.value);

  try{
    await storage.ref('UsersAvatar/${loginScreenController.currentLoggedInUser.value}').putFile(file);
  }on firebase_core.FirebaseException catch(e){
    showErrorSnackBarMessage(
      title: 'Error Uploading Photo',
      message: e.toString(),
    );
  }
}