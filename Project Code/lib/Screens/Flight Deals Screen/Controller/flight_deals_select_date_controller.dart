import 'package:get/get.dart';

class FlightDealsSelectDateController extends GetxController {
  final departureDateFrom = DateTime.now().obs;
  final departureDateTo = DateTime.now().obs;
  final returnDateFrom = DateTime.now().obs;
  final returnDateTo = DateTime.now().obs;
  final roundTrip = false.obs;
  final departureDateFromFormatted = ''.obs;
  final departureDateToFormatted = ''.obs;
  final returnDateFromFormatted = ''.obs;
  final returnDateToFormatted = ''.obs;
  final selectedPeriod = 'Next Month'.obs;
  final stayPeriod = 1.obs;
  final searchInterval = 30.obs;

  void saveSelectedTravelPeriod() {
    if (selectedPeriod.value == 'Next Month') {
      departureDateFrom.value = DateTime.now();
      departureDateTo.value = departureDateFrom.value.add(const Duration(days: 30));
      returnDateFrom.value = DateTime.now();
      returnDateTo.value = returnDateFrom.value.add(const Duration(days: 30));
      searchInterval.value = 30;
    } else if (selectedPeriod.value == 'Next 3 Month') {
      departureDateFrom.value = DateTime.now();
      departureDateTo.value = departureDateFrom.value.add(const Duration(days: 90));
      returnDateFrom.value = DateTime.now();
      returnDateTo.value = returnDateFrom.value.add(const Duration(days: 90));
      searchInterval.value = 90;
    } else if (selectedPeriod.value == 'Next 6 Month') {
      departureDateFrom.value = DateTime.now();
      departureDateTo.value = departureDateFrom.value.add(const Duration(days: 180));
      returnDateFrom.value = DateTime.now();
      returnDateTo.value = returnDateFrom.value.add(const Duration(days: 180));
      searchInterval.value = 180;
    } else if (selectedPeriod.value == 'Next 9 Month') {
      departureDateFrom.value = DateTime.now();
      departureDateTo.value = departureDateFrom.value.add(const Duration(days: 270));
      returnDateFrom.value = DateTime.now();
      returnDateTo.value = returnDateFrom.value.add(const Duration(days: 270));
      searchInterval.value = 270;
    } else if (selectedPeriod.value == 'Next Year') {
      departureDateFrom.value = DateTime.now();
      departureDateTo.value = departureDateFrom.value.add(const Duration(days: 360));
      returnDateFrom.value = DateTime.now();
      returnDateTo.value = returnDateFrom.value.add(const Duration(days: 360));
      searchInterval.value = 360;
    }
    departureDateFromFormatted.value = '${departureDateFrom.value.day.toString()}%2F${departureDateFrom.value.month.toString()}%2F${departureDateFrom.value.year.toString()}';
    departureDateToFormatted.value = '${departureDateTo.value.day.toString()}%2F${departureDateTo.value.month.toString()}%2F${departureDateTo.value.year.toString()}';
    returnDateFromFormatted.value = '${returnDateFrom.value.day.toString()}%2F${returnDateFrom.value.month.toString()}%2F${returnDateFrom.value.year.toString()}';
    returnDateToFormatted.value = '${returnDateTo.value.day.toString()}%2F${returnDateTo.value.month.toString()}%2F${returnDateTo.value.year.toString()}';
  }

  void updateStayPeriod(int value){
    stayPeriod.value = value;
  }

  void updateSearchPeriod(String value){
    selectedPeriod.value = value;
  }
}