import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import '../../../Utilities/Methods/Functions/error_snackBar_message.dart';
import 'flight_booking_request_data.dart';
import 'flight_booking_select_cabin_controller.dart';
import 'flight_booking_select_city_controller.dart';
import 'flight_booking_select_date_controller.dart';
import 'flight_booking_select_passengers_controller.dart';
import 'flight_booking_select_tripType_controller.dart';

final bookingCity = Get.find<FlightBookingCityController>();
final bookingDate = Get.find<FlightBookingDateController>();
final bookingTrip = Get.find<FlightBookingTripTypeController>();
final bookingCabin = Get.find<FlightBookingCabinController>();

class FlightBookingController extends GetxController{

  final showDepartureSearchBar = false.obs;
  final showArrivalSearchBar = false.obs;
  final showLoadingSpinner = false.obs;
  final departureArrivalProvided = false.obs;
  final controllerDeparture = TextEditingController();
  final controllerArrival = TextEditingController();
  final drawerController = AdvancedDrawerController();

  void toggleDepartureSearchBar() {
    showDepartureSearchBar.value = !showDepartureSearchBar.value;
    showArrivalSearchBar.value = false;
  }

  void toggleArrivalSearchBar() {
    showArrivalSearchBar.value = !showArrivalSearchBar.value;
    showDepartureSearchBar.value = false;
  }

  void toggleLoadingSpinner() {
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void toggleDrawer(){
    drawerController.toggleDrawer();
  }

  void checkDepartureArrivalProvide(){
    bookingDate.formatSelectedDate();
    bookingCabin.cabinClass();
    if(bookingCity.departureCityCode.value==bookingCity.arrivalCityCode.value && bookingCity.departureCityCode.value!= '' && bookingCity.arrivalCityCode.value!=''){
      departureArrivalProvided.value = false;
      toggleLoadingSpinner();
      showErrorSnackBarMessage(message: 'Sorry! But You can\'t Provide The Same City For Departure & Arrival', title: 'City Duplicated');
    }else if(bookingCity.departureCityCode.value!='' && bookingCity.arrivalCityCode.value!=''){
      departureArrivalProvided.value = true;
    }else if(bookingCity.departureCityCode.value==''){
      departureArrivalProvided.value = false;
      bookingCity.updateDepartureLabel('You Need To Provide A Departure City');
    }else if(bookingCity.arrivalCityCode.value==''){
      departureArrivalProvided.value = false;
      bookingCity.updateArrivalLabel('You Need To Provide A Destination City');
    }
  }
}