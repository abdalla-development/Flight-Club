import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackedFlightScreenController extends GetxController{

  final showLoadingSpinner = false.obs;
  final latitude = 24.342092.obs;
  final longitude = 42.809327.obs;
  final departureCityCode = ''.obs;
  final destinationCityCode = ''.obs;
  final aircraftRegistration = ''.obs;
  final flightStatus = ''.obs;
  final aircraftLongitude = 0.1.obs;
  final aircraftAltitude = 0.1.obs;
  final aircraftLatitude = 0.1.obs;
  final flightNumber = ''.obs;
  final aircraftDirection = 0.1.obs;
  final aircraftVerticalSpeed = 0.1.obs;
  final aircraftHorizontalSpeed = 0.1.obs;
  final departureActualTime = ''.obs;
  final estimatedArrivalTime = ''.obs;
  final aircraftType = ''.obs;
  final arrivalGate = ''.obs;
  final flightDuration = ''.obs;

  final destinationCity = ''.obs;
  final airlinesName = ''.obs;






  final drawerController = AdvancedDrawerController();
  var responseFlightData = {};

  Set<Marker> markers = <Marker>{};

  void addMarker() async{
    markers.add(
      Marker(
        markerId: const MarkerId('circleCanvasWithText'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(latitude.value, longitude.value),
      ),
    );
  }

  void toggleDrawer(){
    drawerController.toggleDrawer();
  }

  void toggleLoadingSpinner(){
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void loadFlightData(var data){
    responseFlightData = data;
  }

  void loadData(){
    print(responseFlightData['model']);
    latitude.value = (responseFlightData['lat']==null)? 0 : responseFlightData['lat'].toDouble();
    longitude.value = (responseFlightData['lng']==null)? 0 :responseFlightData['lng'].toDouble();
    aircraftAltitude.value = (responseFlightData['alt']==null)? 0: responseFlightData['alt'].toDouble();
    aircraftDirection.value = (responseFlightData['dir']==null)? 0 : responseFlightData['dir'].toDouble();
    aircraftVerticalSpeed.value = (responseFlightData['v_speed']==null)? 0 : responseFlightData['v_speed'].toDouble();
    aircraftHorizontalSpeed.value = (responseFlightData['speed']==null)? 0 : responseFlightData['speed'].toDouble();
    flightNumber.value = responseFlightData['flight_number'];
    departureCityCode.value = responseFlightData['dep_iata'];
    departureActualTime.value = responseFlightData['dep_time'].split(' ')[1];
    destinationCityCode.value = responseFlightData['arr_iata'];
    estimatedArrivalTime.value = responseFlightData['arr_time'].split(' ')[1];
    flightStatus.value = responseFlightData['status'];
    // aircraftType.value = responseFlightData['model'].split('-')[0].split(' ')[1];
    aircraftRegistration.value = (responseFlightData['reg_number']==null)? 'Not Available' : responseFlightData['reg_number'];
    arrivalGate.value = (responseFlightData['arr_gate']==null)? 'Not Available' : responseFlightData['arr_gate'];
    flightDuration.value = (responseFlightData['duration']==null)? 0.toString() : '${(responseFlightData['duration']/60).toString().split('.')[0]} h ${(responseFlightData['duration']/60).toString().split('.')[1]} m';
    addMarker();
  }
}