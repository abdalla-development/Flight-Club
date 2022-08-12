import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/API Requests/get_available_flights_data_request.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Available Flights Screen/Controllers/available_flights_screen_controller.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';
import '../Controller/flight_deals_controller.dart';
import '../Controller/flight_deals_request_data.dart';
import '../Controller/flight_deals_select_tripType_controller.dart';
import '../Models/select_cabin_deals.dart';
import '../Models/select_city_deals.dart';
import '../Models/select_passenger_deals.dart';
import '../Models/select_search_period.dart';
import '../Models/select_trip_type.dart';
import '../Models/suggestions_cities_deals.dart';

class FlightDealsScreen extends StatelessWidget {
   FlightDealsScreen({Key? key}) : super(key: key);

   // final flightDealsController = Get.put(FlightDealsScreenController());
   final flightDealsController = Get.find<FlightDealsScreenController>();
   final searchRequest = Get.find<FlightDealsRequestData>();
   final homeCallingScreen = Get.find<HomeScreenController>();
   final availableFlights = Get.find<AvailableFlightsScreenController>();
   final dealsFlightType = Get.find<FlightDealsSelectTripTypeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> AdvancedDrawer(
        backdropColor: kDrawerBackgroundColor,
        openScale: 0.95,
        openRatio: 0.80,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        controller: flightDealsController.drawerController,
        drawer:  CustomDrawer(),
        child: Stack(
          children: [
            Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              appBar: customAppBar(
                  leadingIcon: const Icon(
                    FontAwesomeIcons.bars,
                    color: Colors.black54,
                  ),
                  title: 'Flight Deals',
                  onPressed: (){
                    flightDealsController.toggleDrawer();
                  },
                  usingTitle: true,
              ),
              body: Container(
                decoration: kAppBackgroundColor,
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 9, right: 9, top: 9),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SelectTripTypeDeals(),
                            const SizedBox(
                              height: 15,
                            ),
                            SelectCityDeals(
                              departureOrArrival: 'Departure',
                            ),
                            (flightDealsController.showDepartureSearchBar.value)
                                ? SuggestionsCitiesDeals(
                                    departureOrArrival: 'Departure', passedWindowHeight: 800,
                                  )
                                : Container(),
                            const SizedBox(height: 15),
                            SelectCityDeals(
                              departureOrArrival: 'Arrival',
                            ),
                            (flightDealsController.showArrivalSearchBar.value)
                                ? SuggestionsCitiesDeals(
                                    departureOrArrival: 'Arrival', passedWindowHeight: 600,
                                  )
                                : Container(),
                            const SizedBox(height: 15),
                            const Text('Passengers', style: TextStyle(fontSize: 20,
                              // color: kAdultsHintTextColor,
                            ),),
                            SelectPassengerDeals(),
                            const SizedBox(height: 15),
                            const Text('Fly Class', style: TextStyle(fontSize: 20,
                              // color: kAdultsHintTextColor,
                            ),),
                            SelectClassCabinDeals(),
                            const SizedBox(height: 15),
                            const Text('Search During', style: TextStyle(fontSize: 20,
                              // color: kAdultsHintTextColor,
                            ),),
                            SelectSearchPeriod(),
                            const SizedBox(height: 25),
                            ElevatedButton(
                              style: kElevationButtonStyle,
                              onPressed: () async{
                                flightDealsController.toggleLoadingSpinner();
                                flightDealsController.checkDepartureArrivalProvide();
                                await searchRequest.loadData();
                                homeCallingScreen.callingScreen('Flight Deals');
                                if(flightDealsController.departureArrivalProvided.value){
                                  availableFlights.selectedFlightType(dealsFlightType.tripType.value);
                                  checkFlights();
                                }
                              },
                              child: const Text('Search'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar:  CustomBottomNavigationBar(),
              // backgroundColor: kPageBackgroundColor,
            ),
            (flightDealsController.showLoadingSpinner.value) ? const Spinner() : Container(),
          ],
        ),
      ),
    );
  }
}
