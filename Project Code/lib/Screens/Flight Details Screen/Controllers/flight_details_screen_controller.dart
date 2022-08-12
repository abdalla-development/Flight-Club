import 'package:flight_booking/Utilities/Configurations/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Utilities/API Requests/get_airlines_name_request.dart';
import '../../Available Flights Screen/Controllers/available_flights_response_controller.dart';
import '../../Available Flights Screen/Controllers/available_flights_screen_controller.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_cabin_controller.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_passengers_controller.dart';
import '../../Flight Deals Screen/Controller/flight_deals_select_cabin_controller.dart';
import '../../Flight Deals Screen/Controller/flight_deals_select_passengers_controller.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';

final responseData = Get.find<AvailableFlightResponseController>();
final availableFlights = Get.find<AvailableFlightsScreenController>();
final flightBookingCabin = Get.find<FlightBookingCabinController>();
final flightBookingPassengers = Get.find<FlightBookingPassengersController>();
final callingScreen = Get.find<HomeScreenController>();
final flightDealsCabin = Get.find<FlightDealsSelectCabinController>();
final flightDealsPassenger = Get.find<FlightDealsSelectPassengersController>();

class FlightDetailsScreenController extends GetxController{

  final showLoadingSpinner = true.obs;
  final drawerController = AdvancedDrawerController();
  final departureCity = ''.obs;
  final departureCityCode = ''.obs;
  final arrivalCity = ''.obs;
  final arrivalCityCode = ''.obs;
  final flightDuration = ''.obs;
  final departureTime = ''.obs; //
  final arrivalTime = ''.obs;
  final flightPrice = ''.obs;
  final flightStops = 0.obs; //
  final flightClass = ''.obs;
  final flightIndex = 0.obs;
  final List<Widget> flightRoutes = [];
  final flightRoutesNumber = 0.obs;
  final flightRoutesNames = [].obs;
  final children = 0.obs;
  final infants = 0.obs;
  final adultFare = ''.obs;
  final childrenFare = ''.obs;
  final infantsFare = ''.obs;

  void loadFlightDetails (){
    if (callingScreen.bookingDeals.value=='Flight Booking'){
      flightIndex.value = availableFlights.cardIndex.value;
      departureCity.value = responseData.responseData[flightIndex.value]['cityFrom'];
      departureCityCode.value = responseData.responseData[flightIndex.value]['flyFrom'];
      arrivalCity.value = responseData.responseData[flightIndex.value]['cityTo'];
      arrivalCityCode.value = responseData.responseData[flightIndex.value]['flyTo'];
      flightDuration.value = '${(responseData.responseData[flightIndex.value]['duration']['total']/60/60).toString().split('.')[0]}h ${(responseData.responseData[flightIndex.value]['duration']['total']/60/60).toStringAsFixed(2).split('.')[1]}m';
      departureTime.value = '${responseData.responseData[flightIndex.value]['local_departure'].split('T')[1].split(':')[0]}:${responseData.responseData[flightIndex.value]['local_departure'].split('T')[1].split(':')[1]}';
      arrivalTime.value = '${responseData.responseData[flightIndex.value]['local_arrival'].split('T')[1].split(':')[0]}:${responseData.responseData[flightIndex.value]['local_arrival'].split('T')[1].split(':')[1]}';
      flightPrice.value = responseData.responseData[flightIndex.value]['price'].toString();
      flightStops.value = responseData.responseData[flightIndex.value]['route'].length-1;
      flightClass.value = flightBookingCabin.selectedClassType.value;
      flightRoutesNumber.value = responseData.responseData[flightIndex.value]['route'].length;
      children.value = flightBookingPassengers.childrenPassengers.value;
      infants.value = flightBookingPassengers.infantsPassengers.value;
      adultFare.value = responseData.responseData[flightIndex.value]['fare']['adults'].toString();
      childrenFare.value = responseData.responseData[flightIndex.value]['fare']['children'].toString();
      infantsFare.value = responseData.responseData[flightIndex.value]['fare']['infants'].toString();
      showFlightRoutesBooking();
    }else {
      flightIndex.value = availableFlights.cardIndex.value;
      departureCity.value = responseData.flightsDataDealsRX[flightIndex.value]['cityFrom'];
      departureCityCode.value = responseData.flightsDataDealsRX[flightIndex.value]['flyFrom'];
      arrivalCity.value = responseData.flightsDataDealsRX[flightIndex.value]['cityTo'];
      arrivalCityCode.value = responseData.flightsDataDealsRX[flightIndex.value]['flyTo'];
      flightDuration.value = '${(responseData.flightsDataDealsRX[flightIndex.value]['duration']['total']/60/60).toString().split('.')[0]}h ${(responseData.flightsDataDealsRX[flightIndex.value]['duration']['total']/60/60).toStringAsFixed(2).split('.')[1]}m';
      departureTime.value = '${responseData.flightsDataDealsRX[flightIndex.value]['local_departure'].split('T')[1].split(':')[0]}:${responseData.flightsDataDealsRX[flightIndex.value]['local_departure'].split('T')[1].split(':')[1]}';
      arrivalTime.value = '${responseData.flightsDataDealsRX[flightIndex.value]['local_arrival'].split('T')[1].split(':')[0]}:${responseData.flightsDataDealsRX[flightIndex.value]['local_arrival'].split('T')[1].split(':')[1]}';
      flightPrice.value = responseData.flightsDataDealsRX[flightIndex.value]['price'].toString();
      flightStops.value = responseData.flightsDataDealsRX[flightIndex.value]['route'].length-1;
      flightClass.value = flightDealsCabin.selectedClassType.value;//
      flightRoutesNumber.value = responseData.flightsDataDealsRX[flightIndex.value]['route'].length;
      children.value = flightDealsPassenger.childrenPassengers.value;
      infants.value = flightDealsPassenger.infantsPassengers.value;
      adultFare.value = responseData.flightsDataDealsRX[flightIndex.value]['fare']['adults'].toString();
      childrenFare.value = responseData.flightsDataDealsRX[flightIndex.value]['fare']['children'].toString();
      infantsFare.value = responseData.flightsDataDealsRX[flightIndex.value]['fare']['infants'].toString();
      showFlightRoutesDeals();
    }
  }

  void showFlightRoutesBooking() async{
    flightRoutes.clear();
    for(int i=0; i<flightRoutesNumber.value; i++){
      String routeDepartureTime = '${responseData.responseData[flightIndex.value]['route'][i]['local_departure'].split('T')[1].split('.')[0].split(':')[0].toString()}:${responseData.responseData[flightIndex.value]['route'][i]['local_departure'].split('T')[1].split('.')[0].split(':')[1].toString()}';
      String routeArrivalTme = '${responseData.responseData[flightIndex.value]['route'][i]['local_arrival'].split('T')[1].split('.')[0].split(':')[0].toString()}:${responseData.responseData[flightIndex.value]['route'][i]['local_arrival'].split('T')[1].split('.')[0].split(':')[1].toString()}';
      DateTime routeDepartureDayTemp = DateFormat("yyyy-MM-dd").parse(responseData.responseData[flightIndex.value]['route'][i]['local_departure'].split('.')[0].split('T')[0].toString());
      String routeDepartureDay = '${DateFormat('EEEEE', 'en_US').format(routeDepartureDayTemp).toString()}, ${responseData.responseData[flightIndex.value]['route'][i]['local_departure'].split('.')[0].split('T')[0].split('-')[2].toString()}';
      DateTime routeArrivalTemp = DateFormat("yyyy-MM-dd").parse(responseData.responseData[flightIndex.value]['route'][i]['local_arrival'].split('.')[0].split('T')[0].toString());
      String routeArrivalDay = '${DateFormat('EEEEE', 'en_US').format(routeArrivalTemp).toString()}, ${responseData.responseData[flightIndex.value]['route'][i]['local_arrival'].split('.')[0].split('T')[0].split('-')[2].toString()}';

      await checkRouteNames(responseData.responseData[flightIndex.value]['route'][i]['airline']); //
      Column column = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(routeDepartureDay),
                  Text(routeDepartureTime),
                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  Row(
                    children: [
                      Text(responseData.responseData[flightIndex.value]['route'][i]['flyFrom'], style: const TextStyle(fontSize: 18),),
                      const SizedBox(width: 8),
                      const Icon(FontAwesomeIcons.rightLong),
                      const SizedBox(width: 8),
                      Text(responseData.responseData[flightIndex.value]['route'][i]['flyTo'], style: const TextStyle(fontSize: 18),),
                    ],
                  ),
                  const SizedBox(height: 6,),
                  Text(flightRoutesNames[i], style: const TextStyle(fontSize: 16),),
                  Text(responseData.responseData[flightIndex.value]['route'][i]['airline'], style: const TextStyle(fontSize: 16),),
                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  Text(routeArrivalDay),
                  Text(routeArrivalTme),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
      );
      flightRoutes.add(column);
      flightRoutes.add(divider);
    }
    showLoadingSpinner.value = false;
  }

  void showFlightRoutesDeals() async{
    flightRoutes.clear();
    for(int i=0; i<flightRoutesNumber.value; i++){
      String routeDepartureTime = '${responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['local_departure'].split('T')[1].split('.')[0].split(':')[0].toString()}:${responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['local_departure'].split('T')[1].split('.')[0].split(':')[1].toString()}';
      String routeArrivalTme = '${responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['local_arrival'].split('T')[1].split('.')[0].split(':')[0].toString()}:${responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['local_arrival'].split('T')[1].split('.')[0].split(':')[1].toString()}';
      DateTime routeDepartureDayTemp = DateFormat("yyyy-MM-dd").parse(responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['local_departure'].split('.')[0].split('T')[0].toString());
      String routeDepartureDay = '${DateFormat('EEEEE', 'en_US').format(routeDepartureDayTemp).toString()}, ${responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['local_departure'].split('.')[0].split('T')[0].split('-')[2].toString()}';
      DateTime routeArrivalTemp = DateFormat("yyyy-MM-dd").parse(responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['local_arrival'].split('.')[0].split('T')[0].toString());
      String routeArrivalDay = '${DateFormat('EEEEE', 'en_US').format(routeArrivalTemp).toString()}, ${responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['local_arrival'].split('.')[0].split('T')[0].split('-')[2].toString()}';

      await checkRouteNames(responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['airline']);
      Column column = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(routeDepartureDay),
                  Text(routeDepartureTime),
                ],
              ),
              const SizedBox(width: 5,),
              Column(
                children: [
                  Row(
                    children: [
                      Text(responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['flyFrom'], style: const TextStyle(fontSize: 16),),
                      const SizedBox(width: 6),
                      const Icon(FontAwesomeIcons.rightLong),
                      const SizedBox(width: 6),
                      Text(responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['flyTo'], style: const TextStyle(fontSize: 16),),
                    ],
                  ),
                  const SizedBox(height: 6,),
                  Text(flightRoutesNames[i], style: const TextStyle(fontSize: 12),),
                  Text(responseData.flightsDataDealsRX[flightIndex.value]['route'][i]['airline'], style: const TextStyle(fontSize: 14),),
                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  Text(routeArrivalDay),
                  Text(routeArrivalTme),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
      );
      flightRoutes.add(column);
      flightRoutes.add(divider);
    }
    showLoadingSpinner.value = false;
  }

  void toggleLoadingSpinner(){
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void toggleDrawer(){
    drawerController.toggleDrawer();
  }

  void addRouteName(String name){
    flightRoutesNames.add(name);
  }
}