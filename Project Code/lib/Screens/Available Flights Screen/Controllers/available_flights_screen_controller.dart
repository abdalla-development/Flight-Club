import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_city_controller.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_date_controller.dart';
import '../../Flight Deals Screen/Controller/flight_deals_select_city_controller.dart';
import '../../Flight Deals Screen/Controller/flight_deals_select_date_controller.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';

final flightBookingDate = Get.find<FlightBookingDateController>();
final flightBookingCity = Get.find<FlightBookingCityController>();
final flightDealsDate = Get.find<FlightDealsSelectDateController>();
final flightDealsCity = Get.find<FlightDealsSelectCityController>();
final homeCallingScreen = Get.find<HomeScreenController>();


class AvailableFlightsScreenController extends GetxController {
  final showLoadingSpinner = false.obs;
  final departureCode = ''.obs;
  final departureCity = ''.obs;
  final arrivalCode = ''.obs;
  final arrivalCity = ''.obs;
  final departureDate = DateTime.now();
  final dayDate = ''.obs;
  final monthDate = ''.obs;
  final formattedDate = ''.obs;
  final drawerController = AdvancedDrawerController();
  final cardIndex = 0.obs;
  final flightIsOneWay = true.obs;

  void loadPageBannerDateData() {
    if(homeCallingScreen.bookingDeals.value == 'Flight Booking'){
      departureCode.value = flightBookingCity.departureCityCode.value;
      arrivalCode.value = flightBookingCity.arrivalCityCode.value;
      dayDate.value = DateFormat('EEEEE', 'en_US').format(flightBookingDate.departureDate.value);
      monthDate.value = DateFormat('MMMM', 'en_US').format(flightBookingDate.departureDate.value);
      formattedDate.value = '$dayDate, ${flightBookingDate.departureDate.value.day.toString()} $monthDate';
      departureCity.value = flightBookingCity.departureCityName.value;
      arrivalCity.value = flightBookingCity.arrivalCityName.value;
    }else{
      departureCode.value = flightDealsCity.departureCityCode.value;
      arrivalCode.value = flightDealsCity.arrivalCityCode.value;
      dayDate.value = DateFormat('EEEEE', 'en_US').format(flightDealsDate.departureDateFrom.value);
      monthDate.value = DateFormat('MMMM', 'en_US').format(flightDealsDate.departureDateFrom.value);
      // formattedDate.value = '$dayDate, ${flightDealsDate.departureDate.value.day.toString()} $monthDate';
      departureCity.value = flightDealsCity.departureCityName.value;
      arrivalCity.value = flightDealsCity.arrivalCityName.value;
    }
  }

  void toggleDrawer() {
    drawerController.toggleDrawer();
  }

  void toggleLoadingSpinner() {
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void updateSelectedCardIndex(int index){
    cardIndex.value= index;
  }

  void selectedFlightType(String value){
    if(value == 'oneway'){
      flightIsOneWay.value = true;
    }else {
      flightIsOneWay.value = false;
    }
  }
}
