import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class FlightTrackingScreenController extends GetxController {

  final latitude = 24.342092.obs;
  final longitude = 42.809327.obs;
  final showLoadingSpinner = false.obs;
  final flightNumber = ''.obs;
  final flightNumberLabel = ''.obs;
  final flightNumberValid = false.obs;
  final drawerController = AdvancedDrawerController();

  void updateLatitude(double value){
    latitude.value = value;
  }

  void updateLongitude(double value){
    longitude.value = value;
  }

  void toggleLoadingSpinner(){
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void updateFlightNumber(String value){
    flightNumber.value = value;
  }

  void updateFlightNumberLabel(String value){
    flightNumberLabel.value = value;
  }

  void toggleDrawer(){
    drawerController.toggleDrawer();
  }

  void checkFlightNumberIsValid(){
    // regex to validate flight number
    Pattern pattern = r'^(([A-Za-z]{2,3})|([A-Za-z]\d)|(\d[A-Za-z]))(\d{1,})([A-Za-z]?)$';
    RegExp regex =  RegExp(pattern.toString());
    if(flightNumber.value!=''){
      (!regex.hasMatch(flightNumber.value))? flightNumberValid.value = false : flightNumberValid.value = true;
    }else if (flightNumber.value==''){
      flightNumberLabel.value = 'Sorry! You Need To Provide A Flight Number';
      flightNumberValid.value = false;
    }
  }
}