import 'package:get/get.dart';
import 'flight_deals_select_cabin_controller.dart';
import 'flight_deals_select_city_controller.dart';
import 'flight_deals_select_date_controller.dart';
import 'flight_deals_select_passengers_controller.dart';
import 'flight_deals_select_tripType_controller.dart';

final dealsCity = Get.find<FlightDealsSelectCityController>();
final dealsDate = Get.find<FlightDealsSelectDateController>();
final dealsTripType = Get.find<FlightDealsSelectTripTypeController>();
final dealsPassengers = Get.find<FlightDealsSelectPassengersController>();
final dealsCabin = Get.find<FlightDealsSelectCabinController>();

class FlightDealsRequestData extends GetxController{
  final departureCity = ''.obs;
  final destinationCity = ''.obs;
  final departureDateFrom = ''.obs;
  final departureDateTo = ''.obs;
  final returnDateFrom = ''.obs;
  final returnDateTo = ''.obs;
  final flightType = ''.obs;
  final numberOfAdults = ''.obs;
  final numberOfChildren = ''.obs;
  final numberOfInfants = ''.obs;
  final classType = ''.obs;

  loadData(){
    departureCity.value = dealsCity.departureCityCode.value;
    destinationCity.value = dealsCity.arrivalCityCode.value;
    departureDateFrom.value = dealsDate.departureDateFromFormatted.value;
    departureDateTo.value = dealsDate.departureDateToFormatted.value;
    returnDateFrom.value = dealsDate.returnDateFromFormatted.value;
    returnDateTo.value = dealsDate.returnDateToFormatted.value;
    flightType.value = dealsTripType.tripType.value;
    numberOfAdults.value =  dealsPassengers.adultsPassengers.value.toString();
    numberOfChildren.value =  dealsPassengers.childrenPassengers.value.toString();
    numberOfInfants.value =  dealsPassengers.infantsPassengers.value.toString();
    classType.value =  dealsCabin.flightClassType.value;
  }
}