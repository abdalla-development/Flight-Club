import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Models/available_flights_card_oneWay.dart';
import '../../../Utilities/Models/available_flights_card_roundTrip.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';
import '../Controllers/available_flights_response_controller.dart';
import '../Controllers/available_flights_screen_controller.dart';

class AvailableFlightsScreen extends StatelessWidget {
  AvailableFlightsScreen({Key? key,}) : super(key: key);

   final availableFlightsController = Get.find<AvailableFlightsScreenController>();
   final responseData = Get.find<AvailableFlightResponseController>();
   final callingScreen = Get.find<HomeScreenController>();

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
        controller: availableFlightsController.drawerController,
        drawer:  CustomDrawer(),
        child: Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              extendBodyBehindAppBar: true,
              extendBody: true,
              appBar: customAppBar(
                  onPressed: (){
                    availableFlightsController.toggleDrawer();
                  },
                  title: 'Available Flights',
                  leadingIcon: const Icon(
                    FontAwesomeIcons.bars,
                    color: Colors.black54,
                  ),
                  usingTitle: true,
              ),
              body: Container(
                decoration: kAppBackgroundColor,
                child: SafeArea(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            availableFlightsController.formattedDate.value,
                            style: const TextStyle(color: Color(0x66F5C7A9), fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                availableFlightsController.departureCity.value,
                                style: const TextStyle(color: Color(0x4dF5C7A9), fontSize: 18),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                FontAwesomeIcons.arrowRightLong,
                                color: Color(0xccA27B5C),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                availableFlightsController.arrivalCity.value,
                                style: const TextStyle(color: Color(0x4dF5C7A9), fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      (callingScreen.bookingDeals.value == 'Flight Deals')? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: responseData.flightsDealsDatesRow,
                          ),
                        ),
                      ) : Container(),
                      (callingScreen.bookingDeals.value == 'Flight Booking')? Container() : const SizedBox(height: 20,),
                      (callingScreen.bookingDeals.value == 'Flight Booking')? Container(
                        height: 570,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Scrollbar(
                          thickness: 5,
                          thumbVisibility: true,
                          radius: const Radius.circular(15),
                          child: ListView(
                            shrinkWrap: true,
                            children: responseData.flightsData,
                          ),
                        ),
                      ): Container(
                        height: 520,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Scrollbar(
                          thickness: 5,
                          thumbVisibility: true,
                          radius: const Radius.circular(15),
                          child: ListView.builder(
                            itemCount: responseData.flightsDataDealsRX.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                // (availableFlightsController.flightIsOneWay.value)?AvailableFlightsCardOneWay(
                                //                                   index: index,
                                //                                   departureCity: responseData.flightsDataDealsRX[index]['flyFrom'],
                                //                                   departureTime:
                                //                                   '${responseData.flightsDataDealsRX[index]['local_departure'].split('T')[1].split(':')[0]}:${responseData.flightsDataDealsRX[index]['local_departure'].split('T')[1].split(':')[1]}',
                                //                                   arrivalCity: responseData.flightsDataDealsRX[index]['flyTo'],
                                //                                   arrivalTime:
                                //                                   '${responseData.flightsDataDealsRX[index]['local_arrival'].split('T')[1].split(':')[0]}:${responseData.flightsDataDealsRX[index]['local_arrival'].split('T')[1].split(':')[1]}',
                                //                                   flightDuration:
                                //                                   '${(responseData.flightsDataDealsRX[index]['duration']['total'] / 60 / 60).toString().split('.')[0]}h ${(responseData.flightsDataDealsRX[index]['duration']['total'] / 60 / 60).toStringAsFixed(2).split('.')[1]}m',
                                //                                   flightPrice: responseData.flightsDataDealsRX[index]['price'].toString(),
                                //                                   handBagWeight: (responseData.flightsDataDealsRX[index]['baglimit']['hand_weight'].toString() == 'null')
                                //                                       ? '0'
                                //                                       : responseData.flightsDataDealsRX[index]['baglimit']['hand_weight'].toString(),
                                //                                   checkInBagWeight: responseData.flightsDataDealsRX[index]['baglimit']['hold_weight'].toString(),
                                //                                 ) : AvailableFlightsCardRoundTrip()
                                margin: const EdgeInsets.only(bottom: 20),
                                child: (availableFlightsController.flightIsOneWay.value)?AvailableFlightsCardOneWay(
                                  index: index,
                                  departureCity: responseData.flightsDataDealsRX[index]['flyFrom'],
                                  departureTime:
                                  '${responseData.flightsDataDealsRX[index]['local_departure'].split('T')[1].split(':')[0]}:${responseData.flightsDataDealsRX[index]['local_departure'].split('T')[1].split(':')[1]}',
                                  arrivalCity: responseData.flightsDataDealsRX[index]['flyTo'],
                                  arrivalTime:
                                  '${responseData.flightsDataDealsRX[index]['local_arrival'].split('T')[1].split(':')[0]}:${responseData.flightsDataDealsRX[index]['local_arrival'].split('T')[1].split(':')[1]}',
                                  flightDuration:
                                  '${(responseData.flightsDataDealsRX[index]['duration']['total'] / 60 / 60).toString().split('.')[0]}h ${(responseData.flightsDataDealsRX[index]['duration']['total'] / 60 / 60).toStringAsFixed(2).split('.')[1]}m',
                                  flightPrice: responseData.flightsDataDealsRX[index]['price'].toString(),
                                  handBagWeight: (responseData.flightsDataDealsRX[index]['baglimit']['hand_weight'].toString() == 'null')
                                      ? '0'
                                      : responseData.flightsDataDealsRX[index]['baglimit']['hand_weight'].toString(),
                                  checkInBagWeight: responseData.flightsDataDealsRX[index]['baglimit']['hold_weight'].toString(),
                                ):AvailableFlightsCardRoundTrip(
                                  index: index,
                                  departureCity: responseData.flightsDataDealsRX[index]['flyFrom'],
                                  departureTime:
                                  '${responseData.flightsDataDealsRX[index]['local_departure'].split('T')[1].split(':')[0]}:${responseData.flightsDataDealsRX[index]['local_departure'].split('T')[1].split(':')[1]}',
                                  arrivalCity: responseData.flightsDataDealsRX[index]['flyTo'],
                                  arrivalTime:
                                  '${responseData.flightsDataDealsRX[index]['local_arrival'].split('T')[1].split(':')[0]}:${responseData.flightsDataDealsRX[index]['local_arrival'].split('T')[1].split(':')[1]}',
                                  flightDuration:
                                  '${(responseData.flightsDataDealsRX[index]['duration']['total'] / 60 / 60).toString().split('.')[0]}h ${(responseData.flightsDataDealsRX[index]['duration']['total'] / 60 / 60).toStringAsFixed(2).split('.')[1]}m',
                                  flightPrice: responseData.flightsDataDealsRX[index]['price'].toString(),
                                  handBagWeight: (responseData.flightsDataDealsRX[index]['baglimit']['hand_weight'].toString() == 'null')
                                      ? '0'
                                      : responseData.flightsDataDealsRX[index]['baglimit']['hand_weight'].toString(),
                                  checkInBagWeight: responseData.flightsDataDealsRX[index]['baglimit']['hold_weight'].toString(),
                                  returnDate: responseData.getReturnDate(index),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: CustomBottomNavigationBar(),
            ),
            (availableFlightsController.showLoadingSpinner.value)
                ? const Spinner()
                : Container(),
          ],
        ),
      ),
    );
  }
}
