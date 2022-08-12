import 'package:get/get.dart';
import 'flight_booking_select_cabin_controller.dart';
import 'flight_booking_select_city_controller.dart';
import 'flight_booking_select_date_controller.dart';
import 'flight_booking_select_passengers_controller.dart';
import 'flight_booking_select_tripType_controller.dart';

final bookingCity = Get.find<FlightBookingCityController>();
final bookingDate = Get.find<FlightBookingDateController>();
final bookingTripType = Get.find<FlightBookingTripTypeController>();
final bookingPassengers = Get.find<FlightBookingPassengersController>();
final bookingCabin = Get.find<FlightBookingCabinController>();

class FlightBookingRequestData extends GetxController{
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
    departureCity.value = bookingCity.departureCityCode.value;
    destinationCity.value = bookingCity.arrivalCityCode.value;
    departureDateFrom.value = bookingDate.departureDateFormatted.value;
    departureDateTo.value = bookingDate.departureDateFormatted.value;
    returnDateFrom.value = bookingDate.returnDateFormatted.value;
    returnDateTo.value = bookingDate.returnDateFormatted.value;
    flightType.value = bookingTripType.tripType.value;
    numberOfAdults.value =  bookingPassengers.adultsPassengers.value.toString();
    numberOfChildren.value =  bookingPassengers.childrenPassengers.value.toString();
    numberOfInfants.value =  bookingPassengers.infantsPassengers.value.toString();
    classType.value =  bookingCabin.flightClassType.value;
  }
}