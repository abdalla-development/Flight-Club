import 'package:get/get.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';
import 'flight_deals_controller.dart';

final homeScreen = Get.find<HomeScreenController>();
final flightDeals = Get.find<FlightDealsScreenController>();

class FlightDealsSelectCityController extends GetxController{
  final departureCityName = ''.obs;
  final departureCityCode = ''.obs;
  final departureHintText = 'Departure From'.obs;
  final arrivalCityName = ''.obs;
  final arrivalCityCode = ''.obs;
  final arrivalHintText = 'Destination City'.obs;
  final arrivalLabelText = ''.obs;
  final departureLabelText = ''.obs;
  final commercialAirportsList = homeScreen.commercialAirportsList.obs;
  final suggestionsCitiesDeparture = homeScreen.suggestionsCitiesDeparture..obs;
  final suggestionsCitiesArrival = homeScreen.suggestionsCitiesArrival..obs;

  void selectDepartureCity({required String cityName, required String cityCode,}){
    departureCityName.value =  cityName;
    departureCityCode.value =  cityCode;
  }

  void selectArrivalCity({required String cityName, required String cityCode,}){
    arrivalCityName.value =  cityName;
    arrivalCityCode.value =  cityCode;
  }

  void updateArrivalHintText(String value){
    arrivalHintText.value = value;
  }

  void updateDepartureHintText(String value){
    departureHintText.value = value;
  }

  void updateSuggestionsListDeparture(List value) {
    suggestionsCitiesDeparture.value =  value;
  }

  void updateSuggestionsListArrival(List value){
    suggestionsCitiesArrival.value =  value;
  }

  void updateDepartureLabel(String value){
    departureLabelText.value = value;
    flightDeals.toggleLoadingSpinner();
  }

  void updateArrivalLabel(String value){
    arrivalLabelText.value = value;
    flightDeals.toggleLoadingSpinner();
  }
}