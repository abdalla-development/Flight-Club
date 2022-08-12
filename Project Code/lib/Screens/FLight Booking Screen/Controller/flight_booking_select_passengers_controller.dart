import 'package:get/get.dart';

class FlightBookingPassengersController extends GetxController{
  final adultsPassengers = 1.obs;
  final childrenPassengers = 0.obs;
  final infantsPassengers = 0.obs;

  void updateNumberOfAdults(int value) {
    adultsPassengers.value = value;
  }

  void updateNumberOfChildren(int value) {
    childrenPassengers.value = value;
  }

  void updateNumberOfInfants(int value) {
    infantsPassengers.value = value;
  }
}