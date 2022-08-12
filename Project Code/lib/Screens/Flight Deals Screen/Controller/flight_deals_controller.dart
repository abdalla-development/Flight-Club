import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import '../../../Utilities/Methods/Functions/error_snackBar_message.dart';
import 'flight_deals_request_data.dart';
import 'flight_deals_select_cabin_controller.dart';
import 'flight_deals_select_city_controller.dart';
import 'flight_deals_select_date_controller.dart';
import 'flight_deals_select_passengers_controller.dart';
import 'flight_deals_select_tripType_controller.dart';

final dealsDate = Get.find<FlightDealsSelectDateController>();
final dealsCabin = Get.find<FlightDealsSelectCabinController>();
final dealsCity = Get.find<FlightDealsSelectCityController>();

class FlightDealsScreenController extends GetxController{

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
    dealsDate.saveSelectedTravelPeriod();
    dealsCabin.cabinClass();
    if(dealsCity.departureCityCode.value==dealsCity.arrivalCityCode.value && dealsCity.departureCityCode.value!= '' && dealsCity.arrivalCityCode.value!=''){
      departureArrivalProvided.value = false;
      toggleLoadingSpinner();
      showErrorSnackBarMessage(message: 'Sorry! But You can\'t Provide The Same City For Departure & Arrival', title: 'City Duplicated');
    }else if(dealsCity.departureCityCode.value!='' && dealsCity.arrivalCityCode.value!=''){
      departureArrivalProvided.value = true;
    }else if(dealsCity.departureCityCode.value==''){
      departureArrivalProvided.value = false;
      dealsCity.updateDepartureLabel('You Need To Provide A Departure City');
    }else if(dealsCity.arrivalCityCode.value==''){
      departureArrivalProvided.value = false;
      dealsCity.updateArrivalLabel('You Need To Provide A Destination City');
    }
  }
}