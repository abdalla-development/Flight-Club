import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

User? user = FirebaseAuth.instance.currentUser;

class SettingsScreenController extends GetxController{
  final showLoadingSpinner = false.obs;
  final showAccountSettings = false.obs;
  final showNotificationsSettings = false.obs;
  final notificationsOn = false.obs;
  final userEmailIsVerified = false.obs;

  void toggleLoadingSpinner(){
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void toggleAccountSettings(){
    showAccountSettings.value = !showAccountSettings.value;
  }

  void toggleNotificationsSettings(){
    showNotificationsSettings.value = !showNotificationsSettings.value;
  }

  void toggleNotifications(bool value){
    notificationsOn.value = value;
  }

  void checkUserEmailVerified(){
    if (user?.emailVerified.toString() == 'false') {
      userEmailIsVerified.value = false;
    }else {
      userEmailIsVerified.value = true;
    }
  }
}