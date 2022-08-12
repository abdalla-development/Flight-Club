import 'package:get/get.dart';

class FlightDealsSelectTripTypeController extends GetxController{
  final tripIsRound = false.obs;
  final oneWay = true.obs;
  final roundTrip = false.obs;
  final tripType = 'oneway'.obs;

  void toggleTripIsRounded(){
    tripIsRound.value = !tripIsRound.value;
    oneWay.value = !oneWay.value;
    roundTrip.value = !roundTrip.value;
    if(oneWay.value){
      tripType.value = 'oneway';
    }else if(roundTrip.value){
      tripType.value = 'round';
    }
  }
}