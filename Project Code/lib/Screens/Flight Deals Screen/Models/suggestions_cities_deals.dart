import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/flight_deals_controller.dart';
import '../Controller/flight_deals_select_city_controller.dart';

class SuggestionsCitiesDeals extends StatelessWidget {
   SuggestionsCitiesDeals({Key? key,
     required this.departureOrArrival,
     required this.passedWindowHeight,
   }) : super(key: key);

   final double passedWindowHeight;
   final String departureOrArrival;
   final dealsCity = Get.find<FlightDealsSelectCityController>();
   final dealsController = Get.find<FlightDealsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: (departureOrArrival=='Departure')?dealsCity.suggestionsCitiesDeparture.length:dealsCity.suggestionsCitiesArrival.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text(
                (departureOrArrival=='Departure')? dealsCity.suggestionsCitiesDeparture[index].cityName : dealsCity.suggestionsCitiesArrival[index].cityName,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              title: Text(
                (departureOrArrival=='Departure')? dealsCity.suggestionsCitiesDeparture[index].cityATACode : dealsCity.suggestionsCitiesArrival[index].cityATACode,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onTap: () {
                String cityName = (departureOrArrival=='Departure')?dealsCity.suggestionsCitiesDeparture[index].cityName:dealsCity.suggestionsCitiesArrival[index].cityName;
                String cityCode = (departureOrArrival=='Departure')?dealsCity.suggestionsCitiesDeparture[index].cityATACode:dealsCity.suggestionsCitiesArrival[index].cityATACode;
                if (departureOrArrival == 'Departure') {
                  dealsCity.selectDepartureCity(cityCode: cityCode, cityName: cityName);
                  dealsCity.updateDepartureHintText(cityName);
                  dealsController.toggleDepartureSearchBar();
                } else {
                  dealsCity.selectArrivalCity(cityCode: cityCode, cityName: cityName);
                  dealsCity.updateArrivalHintText(cityName);
                  dealsController.toggleArrivalSearchBar();
                }
              },
            );
          },
        ),
      ),
    );
  }
}