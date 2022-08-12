import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{

  final retrieveEmail = ''.obs;
  final retrieveEmailLabelText = ''.obs;
  final retrieveMobile = ''.obs;
  final emailIsValid = false.obs;
  final mobileIsValid = false.obs;
  final retrieveEmailSent = false.obs;
  final retrieveMessageSent = false.obs;
  final showLoadingSpinner = false.obs;
  final verificationMethod = 'Email'.obs;

  void updateEmailIsValid(bool value){
    emailIsValid.value = value;
  }

  void updateMobileIsValid(bool value){
    mobileIsValid.value = value;
  }

  void updateRetrieveEmail(String value){
    retrieveEmail.value = value;
  }

  void updateRetrieveMobile(String value){
    retrieveMobile.value = value;
  }

  void toggleRetrieveEmailSent(bool value){
    retrieveEmailSent.value = value;
  }

  void toggleRetrieveMessageSent(bool value){
    retrieveMessageSent.value = value;
  }

  void updateVerificationMethod(String value){
    verificationMethod.value = value;
  }

  void updateRetrieveEmailLabelText(String value){
    retrieveEmailLabelText.value = value;
  }

  void toggleShowLoadingSpinner(){
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }
}