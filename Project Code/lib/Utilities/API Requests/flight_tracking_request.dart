import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Screens/Flight Tracking Screen/Controllers/tracked_flight_screen_controller.dart';

final trackedFlight = Get.find<TrackedFlightScreenController>();
const airlabsAPIKey = String.fromEnvironment('airlabsAPIKey');


trackFlight(String flightNumber) async {

  var response = await http.get(
      Uri.parse('https://airlabs.co/api/v9/flight?api_key=$airlabsAPIKey&flight_iata=$flightNumber'));
  var jsonData = jsonDecode(response.body);
  if(response.statusCode==200){
    trackedFlight.loadFlightData(jsonData['response']);
    trackedFlight.loadData();
  }
}

