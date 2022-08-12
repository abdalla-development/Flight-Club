import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Utilities/Models/available_flights_card_oneWay.dart';
import '../../../Utilities/Models/available_flights_card_roundTrip.dart';
import '../../../Utilities/Models/flight_deals_days_rowItems_constructor.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';
import 'available_flights_screen_controller.dart';

final availableFlights = Get.find<AvailableFlightsScreenController>();
final homeCallingScreen = Get.find<HomeScreenController>();

class AvailableFlightResponseController extends GetxController {
  List<Widget> flightsData = [];
  // final flightsDataT = RxList(List<Widget>)[];
  final flightsDataDealsRX = [].obs;
  final availableDates = [].obs;
  final List<Widget> flightsDealsDatesRow = [];
  final dealsData = {}.obs;
  final itemIndex = 0.obs;
  final itemRowIndex = 0.obs;
  final currentDealPageIndex = 0.obs;
  final dayDate = ''.obs;
  final monthDate = ''.obs;
  final returnDate = ''.obs;
  final formattedDate = ''.obs;
  final responseData = [].obs;
  final responseDataDeals = [].obs;
  final responseDataDealsTotal = [].obs;
  final cardIndex = 0.obs;
  final dealsIndexList = [].obs;

  loadFlightsData(List data) {
    responseData.value = data;
    availableFlights.loadPageBannerDateData();
    if (availableFlights.flightIsOneWay.value) {
      loadAvailableFlightsOneWay(data);
    } else if (!availableFlights.flightIsOneWay.value) {
      loadAvailableFlightsRoundTrip(data);
    }
  }

  void loadAvailableFlightsOneWay(List data) {
    itemIndex.value = 0;
    currentDealPageIndex.value = 0;
    if (homeCallingScreen.bookingDeals.value == 'Flight Booking') {
      for (var obj in data) {
        AvailableFlightsCardOneWay flightsCard = AvailableFlightsCardOneWay(
          index: itemIndex.value,
          departureCity: obj['flyFrom'],
          departureTime:
              '${obj['local_departure'].split('T')[1].split(':')[0]}:${obj['local_departure'].split('T')[1].split(':')[1]}',
          arrivalCity: obj['flyTo'],
          arrivalTime:
              '${obj['local_arrival'].split('T')[1].split(':')[0]}:${obj['local_arrival'].split('T')[1].split(':')[1]}',
          flightDuration:
              '${(obj['duration']['total'] / 60 / 60).toString().split('.')[0]}h ${(obj['duration']['total'] / 60 / 60).toStringAsFixed(2).split('.')[1]}m',
          flightPrice: obj['price'].toString(),
          handBagWeight: (obj['baglimit']['hand_weight'].toString() == 'null')
              ? '0'
              : obj['baglimit']['hand_weight'].toString(),
          checkInBagWeight: obj['baglimit']['hold_weight'].toString(),
        );
        SizedBox space = const SizedBox(
          height: 30,
        );
        flightsData.add(flightsCard);
        flightsData.add(space);
        itemIndex.value++;
      }
    } else {
      for (var obj in data) {
        if (!availableDates.contains(obj['local_departure'].split('T')[0])) {
          availableDates.add(obj['local_departure'].split('T')[0]);
          FlightDealsFilterByDayWidgetConstructor filterByDayWidgetConstructor =
              FlightDealsFilterByDayWidgetConstructor(
            date: obj['local_departure'].split('T')[0],
            index: itemRowIndex.value,
          );
          SizedBox sizedBox = const SizedBox(
            width: 8,
          );
          flightsDealsDatesRow.add(filterByDayWidgetConstructor);
          flightsDealsDatesRow.add(sizedBox);
          itemRowIndex.value++;
        }
      }
      flightsDataDealsRX.clear();
      itemRowIndex.value=0;
      for (var obj in responseDataDealsTotal) {
        if (availableDates[currentDealPageIndex.value] == obj['local_departure'].split('T')[0]) {
          flightsDataDealsRX.add(obj);
        }
      }
    }
  }

  void loadAvailableFlightsRoundTrip(List data) {
    itemIndex.value = 0;
    if (homeCallingScreen.bookingDeals.value == 'Flight Booking'){
      for (var obj in data) {
        for (var item in obj['route']) {
          if (item['flyFrom'] == obj['flyTo']) {
            returnDate.value = item['local_departure'].split('T')[0].toString();
          }
        }
        AvailableFlightsCardRoundTrip flightsCard = AvailableFlightsCardRoundTrip(
          index: itemIndex.value,
          departureCity: obj['flyFrom'],
          departureTime:
          '${obj['local_departure'].split('T')[1].split(':')[0]}:${obj['local_departure'].split('T')[1].split(':')[1]}',
          arrivalCity: obj['flyTo'],
          arrivalTime:
          '${obj['local_arrival'].split('T')[1].split(':')[0]}:${obj['local_arrival'].split('T')[1].split(':')[1]}',
          flightDuration:
          '${(obj['duration']['total'] / 60 / 60).toString().split('.')[0]}h ${(obj['duration']['total'] / 60 / 60).toStringAsFixed(2).split('.')[1]}m',
          flightPrice: obj['price'].toString(),
          handBagWeight: (obj['baglimit']['hand_weight'].toString() == 'null')
              ? '0'
              : obj['baglimit']['hand_weight'].toString(),
          checkInBagWeight: obj['baglimit']['hold_weight'].toString(),
          returnDate: returnDate.value,
        );
        SizedBox space = const SizedBox(
          height: 30,
        );
        flightsData.add(flightsCard);
        flightsData.add(space);
        itemIndex.value++;
      }
    }else{
      for (var obj in data) {
        if (!availableDates.contains(obj['local_departure'].split('T')[0])) {
          availableDates.add(obj['local_departure'].split('T')[0]);
          FlightDealsFilterByDayWidgetConstructor filterByDayWidgetConstructor =
          FlightDealsFilterByDayWidgetConstructor(
            date: obj['local_departure'].split('T')[0],
            index: itemRowIndex.value,
          );
          SizedBox sizedBox = const SizedBox(
            width: 8,
          );
          flightsDealsDatesRow.add(filterByDayWidgetConstructor);
          flightsDealsDatesRow.add(sizedBox);
          itemRowIndex.value++;
        }
      }
      flightsDataDealsRX.clear();
      itemRowIndex.value=0;
      for (var obj in responseDataDealsTotal) {
        if (availableDates[currentDealPageIndex.value] == obj['local_departure'].split('T')[0]) {
          flightsDataDealsRX.add(obj);
        }
      }
    }
  }

  void loadAvailableFlightsDealsOneWay(List data) {
    itemIndex.value = 0;
    itemRowIndex.value = 0;
    // List availableDates = [];
    // List flightsDataDeals = [];
    print('here');
  }


  void updateRowItemIndex(int index) {
    currentDealPageIndex.value = index;
    itemRowIndex.value = index;
    flightsDataDealsRX.clear();
    for (var obj in responseDataDealsTotal) {
      if (availableDates[currentDealPageIndex.value] == obj['local_departure'].split('T')[0]) {
        flightsDataDealsRX.add(obj);
      }
    }
  }

  void loadResponseData(List data) {
    responseDataDealsTotal.value = data;
  }

  String getReturnDate(int index){
    String date= '';
    // flightsDataDealsRX[index]
    for (var item in flightsDataDealsRX[index]['route']) {
      if (item['flyFrom'] == flightsDataDealsRX[index]['flyTo']) {
        date = item['local_departure'].split('T')[0].toString();
      }
    }
    return date;
  }
}
