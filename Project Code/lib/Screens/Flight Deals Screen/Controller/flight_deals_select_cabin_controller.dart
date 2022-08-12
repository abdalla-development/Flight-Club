import 'package:get/get.dart';

class FlightDealsSelectCabinController extends GetxController{
  final selectedClassType = 'Economy'.obs;
  final flightClassType = 'M'.obs;

  void updateSelectedClass(String value) {
    selectedClassType.value = value;
  }

  void cabinClass() {
    if (selectedClassType.value == 'Economy') {
      flightClassType.value = 'M';
    } else if (selectedClassType.value == 'Economy Premium') {
      flightClassType.value = 'W';
    } else if (selectedClassType.value == 'Business Class') {
      flightClassType.value = 'C';
    } else if (selectedClassType.value == 'First Class') {
      flightClassType.value = 'F';
    }
  }
}