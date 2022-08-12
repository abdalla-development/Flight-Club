import 'package:flight_booking/Screens/Add%20Passengers%20Information%20Screen/Controllers/passengers_information_data_controller.dart';
import 'package:flight_booking/Utilities/Configurations/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_passengers_controller.dart';
import '../Models/passengers_information_cards.dart';

final bookingPassengers = Get.find<FlightBookingPassengersController>();
final enteredPassengersData = Get.find<PassengersInformationDataController>();

class PassengersInformationScreenController extends GetxController {
  final showLoadingSpinner = false.obs;
  final drawerController = AdvancedDrawerController();
  final List<Widget> passengerCardsListAdults = [];
  final List<Widget> passengerCardsListChildren = [];
  final List<Widget> passengerCardsListInfants = [];
  final numberOfAdults = 0.obs;
  final numberOfChildren = 0.obs;
  final numberOfInfants = 0.obs;
  final adultsIndex = 0.obs;
  final childrenIndex = 0.obs;
  final infantsIndex = 0.obs;
  final informationDataIndex = 0.obs;
  final informationProvided = false.obs;

  void toggleLoadingSpinner() {
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void toggleDrawer() {
    drawerController.toggleDrawer();
  }

  void constructPassengersInfoCard() {
    passengerCardsListAdults.clear();
    passengerCardsListChildren.clear();
    passengerCardsListInfants.clear();
    adultsIndex.value = 0;
    childrenIndex.value = 0;
    infantsIndex.value = 0;
    numberOfAdults.value = bookingPassengers.adultsPassengers.value;
    numberOfChildren.value = bookingPassengers.childrenPassengers.value;
    numberOfInfants.value = bookingPassengers.infantsPassengers.value;

    SizedBox sizedBox = const SizedBox(height: 6);

    for (int i=0; i< numberOfAdults.value; i++){
      PassengersInformationCard passengersInformationCard =  PassengersInformationCard(index: adultsIndex.value, list: 'Adults',);
      passengerCardsListAdults.add(passengersInformationCard);
      passengerCardsListAdults.add(sizedBox);
      adultsIndex.value++;
    }
    passengerCardsListAdults.add(divider);
    passengerCardsListAdults.add(sizedBox);

    for (int i=0; i< numberOfChildren.value; i++){
      PassengersInformationCard passengersInformationCard =  PassengersInformationCard(index: childrenIndex.value, list: 'Children',);
      passengerCardsListChildren.add(sizedBox);
      passengerCardsListChildren.add(passengersInformationCard);
      childrenIndex.value++;
    }
    passengerCardsListChildren.add(sizedBox);
    passengerCardsListChildren.add(divider);
    passengerCardsListChildren.add(sizedBox);

    for (int i=0; i< numberOfInfants.value; i++){
      PassengersInformationCard passengersInformationCard =  PassengersInformationCard(index: infantsIndex.value, list: 'Infants',);
      passengerCardsListInfants.add(sizedBox);
      passengerCardsListInfants.add(passengersInformationCard);
      infantsIndex.value++;
    }
    passengerCardsListInfants.add(sizedBox);
    passengerCardsListInfants.add(divider);
    passengerCardsListInfants.add(sizedBox);
  }

  void checkInformationIsProvided(){
    informationDataIndex.value = adultsIndex.value + childrenIndex.value +  infantsIndex.value;
    if(informationDataIndex.value==enteredPassengersData.passengersData.length){
      informationProvided.value = true;
    }else {
      informationProvided.value = false;
    }
  }
}
