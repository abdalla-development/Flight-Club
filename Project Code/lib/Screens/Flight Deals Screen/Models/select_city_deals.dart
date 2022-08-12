import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/API Requests/get_international_airports_list_request.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../Controller/flight_deals_controller.dart';
import '../Controller/flight_deals_select_city_controller.dart';

class SelectCityDeals extends StatelessWidget {
  SelectCityDeals({
    Key? key,
    required this.departureOrArrival,
  }) : super(key: key);

  final dealsController = Get.find<FlightDealsScreenController>();
  final dealsCity = Get.find<FlightDealsSelectCityController>();
  final String departureOrArrival;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: (departureOrArrival == 'Departure')
            ? dealsController.controllerDeparture
            : dealsController.controllerArrival,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: (departureOrArrival == 'Departure')
              ? dealsCity.departureHintText.value
              : dealsCity.arrivalHintText.value,
          hintStyle: const TextStyle(
            color: kTextFieldHintTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          labelText: (departureOrArrival == 'Departure')
              ? dealsCity.departureLabelText.value
              : dealsCity.arrivalLabelText.value,
          labelStyle: const TextStyle(color:  Colors.red),
          prefixIcon: (departureOrArrival == 'Departure')
              ? const Icon(
                  FontAwesomeIcons.planeDeparture,
                  // color: kTextFieldIconsColor,
                )
              : const Icon(
                  FontAwesomeIcons.planeArrival,
                  // color: kTextFieldIconsColor,
                ),
        ),
        onChanged: (value) {
          (departureOrArrival == 'Departure')
              ? dealsCity.updateDepartureLabel('')
              : dealsCity.updateArrivalLabel('');
          List cities = dealsCity.commercialAirportsList.value;
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
              ? dealsCity.updateSuggestionsListDeparture(listFiltered)
              : dealsCity.updateSuggestionsListArrival(listFiltered);
        },
        onTap: () {
          (departureOrArrival == 'Departure')
              ? dealsController.toggleDepartureSearchBar()
              : dealsController.toggleArrivalSearchBar();
        },
      ),
    );
  }
}
