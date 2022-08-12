import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/flight_booking_controller.dart';
import '../Controller/flight_booking_select_city_controller.dart';

class SuggestionsCities extends StatelessWidget {
   SuggestionsCities({Key? key,
     required this.departureOrArrival,
    required this.passedWindowHeight,
   }) : super(key: key);

  final double passedWindowHeight;
  final String departureOrArrival;
   final flightBookingCity = Get.find<FlightBookingCityController>();
   final flightBooking = Get.find<FlightBookingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> SizedBox(
        height: passedWindowHeight,
        child: ListView.builder(
          itemCount: (departureOrArrival=='Departure')?flightBookingCity.suggestionsCitiesDeparture.length:flightBookingCity.suggestionsCitiesArrival.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text(
                (departureOrArrival=='Departure')?flightBookingCity.suggestionsCitiesDeparture[index].cityName:flightBookingCity.suggestionsCitiesArrival[index].cityName,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              title: Text(
                (departureOrArrival=='Departure')?flightBookingCity.suggestionsCitiesDeparture[index].cityATACode:flightBookingCity.suggestionsCitiesArrival[index].cityATACode,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onTap: () {
                String cityName = (departureOrArrival=='Departure')?flightBookingCity.suggestionsCitiesDeparture[index].cityName:flightBookingCity.suggestionsCitiesArrival[index].cityName;
                String cityCode = (departureOrArrival=='Departure')?flightBookingCity.suggestionsCitiesDeparture[index].cityATACode:flightBookingCity.suggestionsCitiesArrival[index].cityATACode;

                if (departureOrArrival == 'Departure') {
                  flightBookingCity.selectDepartureCity(cityCode: cityCode, cityName: cityName);
                  flightBookingCity.updateDepartureHintText(cityName);
                  flightBooking.toggleDepartureSearchBar();
                } else {
                  flightBookingCity.selectArrivalCity(cityCode: cityCode, cityName: cityName);
                  flightBookingCity.updateArrivalHintText(cityName);
                  flightBooking.toggleArrivalSearchBar();
                }
              },
            );
          },
        ),
      ),
    );
  }
}