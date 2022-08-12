import 'package:get/get.dart';
import '../../../Screens/Available Flights Screen/Controllers/available_flights_response_controller.dart';

final responseData = Get.find<AvailableFlightResponseController>();

 filterFlightDeals(var data){
  double mean = 0;
  List filteredDataList = [];
  for (var obj in data) {
    mean = mean + obj['price'].toDouble();
  }
  mean = mean / data.length;

  for (var obj in data){
    if(mean<obj['price']){
      filteredDataList.add(obj);
    }
  }
  responseData.loadResponseData(filteredDataList);
  responseData.loadFlightsData(filteredDataList);
}