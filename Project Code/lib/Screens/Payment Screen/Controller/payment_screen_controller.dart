import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class PaymentScreenController extends GetxController{
  final showLoadingSpinner = false.obs;
  final drawerController = AdvancedDrawerController();
  final cardNumber = ''.obs;
  final cardCVV = ''.obs;
  final cardMonthExpiration = ''.obs;
  final cardYearExpiration = ''.obs;
  final paymentAmount = ''.obs;
  final bookingToken = ''.obs;
  final paymentSuccessful = false.obs;

  void toggleLoadingSpinner(){
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void toggleDrawer(){
    drawerController.toggleDrawer();
  }

  void addCardNumber(String value){
    cardNumber.value = value;
  }

  void addCardCVV(String value){
    cardCVV.value = value;
  }

  void addCardMonthExpiration(String value){
    cardMonthExpiration.value = value;
  }

  void addCardYearExpiration(String value){
    cardYearExpiration.value = value;
  }

  void addPaymentAmount(String value){
    paymentAmount.value = value;
  }

  void addBookingToken(String value){
    bookingToken.value = value;
  }

  void checkPaymentSuccessful(){
    // check if the payment was successful
  }
}