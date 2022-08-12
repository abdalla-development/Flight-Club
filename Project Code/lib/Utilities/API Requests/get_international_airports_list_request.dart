import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Screens/Home Screen/Controllers/home_screen_controller.dart';

final homeScreen = Get.find<HomeScreenController>();
String tequilaAPIKey = dotenv.env['tequilaAPIKey'] as String;


class Cities {
  final String cityName;
  final String cityATACode;
  Cities({required this.cityATACode, required this.cityName});

}

void getAirportData() async {
  Map<String, String> headers = {
    "apikey": tequilaAPIKey,
  };

  print(dotenv.env['tequilaAPIKey']);

  var response = await http.get(
      Uri.parse('https://tequila-api.kiwi.com/locations/dump?locale=en-US&location_types=airport&limit=10000&sort=name&active_only=true'),
      headers: headers);

  List<Cities> citiesAirportList = [];

  if (response.statusCode == 200){
    var jsonData = jsonDecode(response.body);
    for (var obj in jsonData['locations']) {
      Cities city = Cities(cityATACode: obj['id'], cityName: obj['name']);
      citiesAirportList.add(city);
    }
    homeScreen.updateCommercialAirportsList(citiesAirportList);
  }else{

  }
}
