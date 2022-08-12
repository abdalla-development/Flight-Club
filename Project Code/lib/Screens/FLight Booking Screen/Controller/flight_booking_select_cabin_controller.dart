import 'package:get/get.dart';

class FlightBookingCabinController extends GetxController {
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
    } else if (selectedClassType.value == 'Business') {
      flightClassType.value = 'C';
    } else {
      flightClassType.value = 'F';
    }
  }
}