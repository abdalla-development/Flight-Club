import 'package:get/get.dart';
import '../../FLight Booking Screen/Controller/flight_booking_request_data.dart';
import '../../Flight Deals Screen/Controller/flight_deals_request_data.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';

final flightBooking = Get.find<FlightBookingRequestData>();
final callingScreen = Get.find<HomeScreenController>();
final flightDeals = Get.find<FlightDealsRequestData>();


class AvailableFlightRequestController extends GetxController{
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
  final sortBy = ''.obs;

  void updateAPIRequestData() {
    if(callingScreen.bookingDeals.value=='Flight Booking'){
      departureCity.value = flightBooking.departureCity.value;
      destinationCity.value = flightBooking.destinationCity.value;
      departureDateFrom.value = flightBooking.departureDateFrom.value;
      departureDateTo.value = flightBooking.departureDateTo.value;
      returnDateFrom.value = flightBooking.returnDateFrom.value;
      returnDateTo.value = flightBooking.returnDateTo.value;
      flightType.value = flightBooking.flightType.value;
      numberOfAdults.value = flightBooking.numberOfAdults.value;
      numberOfChildren.value = flightBooking.numberOfChildren.value;
      numberOfInfants.value = flightBooking.numberOfInfants.value;
      classType.value = flightBooking.classType.value;
      sortBy.value = 'price';
    }else if(callingScreen.bookingDeals.value=='Flight Deals'){
      departureCity.value = flightDeals.departureCity.value;
      destinationCity.value = flightDeals.destinationCity.value;
      departureDateFrom.value = flightDeals.departureDateFrom.value;
      departureDateTo.value = flightDeals.departureDateTo.value;
      returnDateFrom.value = flightDeals.returnDateFrom.value;
      returnDateTo.value = flightDeals.returnDateTo.value;
      flightType.value = flightDeals.flightType.value;
      numberOfAdults.value = flightDeals.numberOfAdults.value;
      numberOfChildren.value = flightDeals.numberOfChildren.value;
      numberOfInfants.value = flightDeals.numberOfInfants.value;
      classType.value = flightDeals.classType.value;
      sortBy.value = 'date';
    }
  }
}