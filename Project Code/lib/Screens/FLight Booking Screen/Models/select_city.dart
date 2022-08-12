import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/API Requests/get_international_airports_list_request.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../Controller/flight_booking_controller.dart';
import '../Controller/flight_booking_select_city_controller.dart';

class SelectCity extends StatelessWidget {
  SelectCity({
    Key? key,
    required this.departureOrArrival,
  }) : super(key: key);

  final flightBooking = Get.find<FlightBookingController>();
  final flightBookingCity = Get.find<FlightBookingCityController>();
  final String departureOrArrival;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: (departureOrArrival == 'Departure')
            ? flightBooking.controllerDeparture
            : flightBooking.controllerArrival,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: (departureOrArrival == 'Departure')
              ? flightBookingCity.departureHintText.value
              : flightBookingCity.arrivalHintText.value,
          labelText: (departureOrArrival == 'Departure')
              ? (flightBookingCity.departureCityName.value != '')
                  ? null
                  : flightBookingCity.departureLabelText.value
              : (flightBookingCity.arrivalCityName.value != '')
                  ? null
                  : flightBookingCity.arrivalLabelText.value,
          labelStyle: const TextStyle(color: Colors.red),
          hintStyle: const TextStyle(
            color: kTextFieldHintTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: (departureOrArrival == 'Departure')
              ? const Icon(
                  FontAwesomeIcons.planeDeparture,
                  color: kTextFieldIconsColor,
                )
              : const Icon(
                  FontAwesomeIcons.planeArrival,
                  color: kTextFieldIconsColor,
                ),
        ),
        onChanged: (value) {
          (departureOrArrival=='Departure')? flightBookingCity.updateDepartureLabel('') : flightBookingCity.updateArrivalLabel('') ;
          List cities = flightBookingCity.commercialAirportsList.value;
          List listFiltered = cities
              .where((city) =>
                  city.cityName.toLowerCase().contains(value.toLowerCase()))
              .toList();
          if (listFiltered.isEmpty) {
            Cities empty =
                Cities(cityATACode: '', cityName: 'Sorry No Result Match');
            listFiltered.add(empty);
          }
          (departureOrArrival == 'Departure')
              ? flightBookingCity.updateSuggestionsListDeparture(listFiltered)
              : flightBookingCity.updateSuggestionsListArrival(listFiltered);
        },
        onTap: () {
          (departureOrArrival == 'Departure')
              ? flightBooking.toggleDepartureSearchBar()
              : flightBooking.toggleArrivalSearchBar();
        },
      ),
    );
  }
}
