import 'package:get/get.dart';

class FlightBookingDateController extends GetxController{
  final departureDate = DateTime.now().obs;
  final returnDate = DateTime.now().obs;
  final roundTrip = false.obs;
  final departureDateFormatted = ''.obs;
  final returnDateFormatted = ''.obs;

  void saveSelectedDepartureDay(DateTime value){
    departureDate.value = value;
    formatSelectedDate();
  }

  void saveSelectedArrivalDay(DateTime value){
    returnDate.value =  value;
    formatSelectedDate();
  }

  void formatSelectedDate(){
    if (!roundTrip.value){
      returnDate.value = departureDate.value.add(const Duration(days: 1));
    }
    departureDateFormatted.value = '${departureDate.value.day.toString()}%2F${departureDate.value.month.toString()}%2F${departureDate.value.year.toString()}';
    returnDateFormatted.value = '${returnDate.value.day.toString()}%2F${returnDate.value.month.toString()}%2F${returnDate.value.year.toString()}';
  }
}