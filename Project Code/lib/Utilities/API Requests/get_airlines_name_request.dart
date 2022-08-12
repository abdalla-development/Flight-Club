import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Screens/Flight Details Screen/Controllers/flight_details_screen_controller.dart';

final flightDetails = Get.find<FlightDetailsScreenController>();
String airlabsAPIKey = dotenv.env['tequilaAPIKey'] as String;



 checkRouteNames(String name) async {
  var response = await http.get(
      Uri.parse('https://airlabs.co/api/v9/airlines?iata_code=$name&api_key=$airlabsAPIKey'));
  var jsonData = jsonDecode(response.body);
   if(response.statusCode==200){
     flightDetails.addRouteName(jsonData['response'][0]['name']);
   }
}

