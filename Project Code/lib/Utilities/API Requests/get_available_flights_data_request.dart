import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Screens/Available Flights Screen/Controllers/available_flights_request_controller.dart';
import '../../Screens/Available Flights Screen/Controllers/available_flights_response_controller.dart';
import '../../Screens/FLight Booking Screen/Controller/flight_booking_controller.dart';
import '../../Screens/Flight Deals Screen/Controller/flight_deals_controller.dart';
import '../../Screens/Home Screen/Controllers/home_screen_controller.dart';
import '../Methods/Functions/error_snackBar_message.dart';
import '../Methods/Functions/filter_flight_deals.dart';

final requestData = Get.find<AvailableFlightRequestController>();
final responseData = Get.find<AvailableFlightResponseController>();
final homeCallingScreen = Get.find<HomeScreenController>();
final flightBookingController = Get.find<FlightBookingController>();
final flightDealsController = Get.find<FlightDealsScreenController>();
String tequilaAPIKey = dotenv.env['tequilaAPIKey'] as String;

String bookingToken = '';
int itemIndex = 0;
List<Widget> flightsData = [];

void checkFlights() async {
  Map<String, String> headers = {
    "apikey": tequilaAPIKey,
  };

  requestData.updateAPIRequestData();

  var response = await http.get(
      Uri.parse(
          'https://tequila-api.kiwi.com/v2/search?fly_from=${requestData.departureCity.value}&fly_to=${requestData.destinationCity.value}&date_from=${requestData.departureDateFrom.value}&date_to=${requestData.departureDateTo.value}&return_from=${requestData.returnDateFrom.value}&return_to=${requestData.returnDateTo.value}&flight_type=${requestData.flightType}&adults=${requestData.numberOfAdults.value}&children=${requestData.numberOfChildren.value}&infants=${requestData.numberOfInfants.value}&selected_cabins=${requestData.classType.value}&curr=USD&sort=${requestData.sortBy.value}'),
      headers: headers);
  var jsonData = jsonDecode(response.body);
  // bookingToken = jsonData['data'][0]['booking_token'];

  if (response.statusCode == 200 &&
      homeCallingScreen.bookingDeals.value == 'Flight Booking') {
    await responseData.loadFlightsData(jsonData['data']);
    flightBookingController.toggleLoadingSpinner();
    (jsonData['data'].length != 0)
        ? Get.toNamed('/AvailableFlightsScreen')
        : showErrorSnackBarMessage(
            message: 'Sorry! Try Another Day', title: 'No Available Flights');
  } else if (response.statusCode == 200 &&
      homeCallingScreen.bookingDeals.value == 'Flight Deals') {
    await filterFlightDeals(jsonData['data']);
    flightDealsController.toggleLoadingSpinner();
    Get.toNamed('/AvailableFlightsScreen');
  }
}
