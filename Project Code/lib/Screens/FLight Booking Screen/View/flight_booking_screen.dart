import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/API Requests/get_available_flights_data_request.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Available Flights Screen/Controllers/available_flights_screen_controller.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';
import '../Controller/flight_booking_controller.dart';
import '../Controller/flight_booking_request_data.dart';
import '../Controller/flight_booking_select_tripType_controller.dart';
import '../Models/enter_promotion_code.dart';
import '../Models/select_cabin.dart';
import '../Models/select_city.dart';
import '../Models/select_date.dart';
import '../Models/select_passengers.dart';
import '../Models/select_trip_type.dart';
import '../Models/suggestions_cities.dart';

class FlightBookingScreen extends StatelessWidget {
   FlightBookingScreen({Key? key}) : super(key: key);

   // final flightBookingController = Get.put(FlightBookingController());
   final flightBookingController = Get.find<FlightBookingController>();
   final searchRequest = Get.find<FlightBookingRequestData>();
   final homeCallingScreen = Get.find<HomeScreenController>();
   final availableFlights = Get.find<AvailableFlightsScreenController>();
   final bookingFlightType = Get.find<FlightBookingTripTypeController>();

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
        controller: flightBookingController.drawerController,
        drawer:  CustomDrawer(),
        child: Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              extendBodyBehindAppBar: true,
              extendBody: true,
              appBar: customAppBar(
                  onPressed: (){
                    flightBookingController.toggleDrawer();
                  },
                  leadingIcon: const Icon(
                    FontAwesomeIcons.bars,
                    color: Colors.black54,
                  ),
                  title: 'Flight Booking',
                  usingTitle: true,
              ),
              body: Container(
                decoration: kAppBackgroundColor,
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 9, right: 9, top: 9),
                      child: DefaultTextStyle(
                        style: GoogleFonts.raleway(
                          // color: kMainTextColor,
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SelectTripType(),
                              const SizedBox(height: 10),
                              SelectCity(
                                departureOrArrival: 'Departure',
                              ),
                              (flightBookingController.showDepartureSearchBar.value)
                                  ? SuggestionsCities(
                                  departureOrArrival: 'Departure',
                                  passedWindowHeight: 800,
                              )
                                  : Container(),
                              const SizedBox(height: 10),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.autorenew_rounded),
                              ),
                              const SizedBox(height: 10),
                              SelectCity(departureOrArrival: 'Arrival'),
                              (flightBookingController.showArrivalSearchBar.value)
                                  ? SuggestionsCities(
                                  departureOrArrival: 'Arrival',
                                  passedWindowHeight: 600,
                              )
                                  : Container(),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  SelectDate(departureOrReturn: 'Departure'),
                                  const SizedBox(width: 40),
                                  SelectDate(departureOrReturn: 'Arrival'),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SelectPassenger(),
                              const SizedBox(height: 10),
                              SelectClassCabin(),
                              const SizedBox(height: 10),
                              PromotionCode(),
                              const SizedBox(height: 60),
                              ElevatedButton(
                                style: kElevationButtonStyle,
                                onPressed: () async{
                                  flightBookingController.toggleLoadingSpinner();
                                  flightBookingController.checkDepartureArrivalProvide();
                                  await searchRequest.loadData();
                                  homeCallingScreen.callingScreen('Flight Booking');
                                  if(flightBookingController.departureArrivalProvided.value){
                                    availableFlights.selectedFlightType(bookingTripType.tripType.value);
                                    checkFlights();
                                  }
                                },
                                child: const Text('Search'),
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar:  CustomBottomNavigationBar(),
            ),
            (flightBookingController.showLoadingSpinner.value) ? const Spinner() : Container(),
          ],
        ),
      ),
    );
  }
}
