import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Add Passengers Information Screen/Controllers/passengers_information_screen_controller.dart';
import '../../Payment Screen/Controller/payment_screen_controller.dart';
import '../Controllers/flight_details_screen_controller.dart';
import '../Models/flight_details_flight_general_info.dart';
import '../Models/flight_details_flight_time_info.dart';
import '../Models/flight_details_main_flight_fare.dart';
import '../Models/flight_details_main_flight_info.dart';

class FlightDetailsScreen extends StatelessWidget {
  FlightDetailsScreen({
    Key? key,
  }) : super(key: key);

  final flightsDetailsController = Get.find<FlightDetailsScreenController>();
  final passengersInfo = Get.find<PassengersInformationScreenController>();
  final payment = Get.find<PaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AdvancedDrawer(
        backdropColor: kDrawerBackgroundColor,
        openScale: 0.95,
        openRatio: 0.80,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        controller: flightsDetailsController.drawerController,
        drawer:  CustomDrawer(),
        child: Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              extendBodyBehindAppBar: true,
              extendBody: true,
              appBar: customAppBar(
                usingTitle: true,
                leadingIcon: const Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.black54,
                ),
                title: 'Flight Details',
                onPressed: () {
                  flightsDetailsController.toggleDrawer();
                },
              ),
              body: Container(
                decoration: kAppBackgroundColor,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlightDetailsMainFlightInfo(),
                      const SizedBox(height: 20),
                      FlightDetailsFlightTimeInfo(),
                      const SizedBox(height: 20),
                      FlightDetailsFlightGeneralInfo(),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, right: 15, left: 15),
                        child: const Text(
                          'Fare',
                          style:
                              TextStyle(fontSize: 24, color: Color(0xff2C3639)),
                        ),
                      ),
                      FlightDetailsMainFlightFare(),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, right: 15, left: 15),
                        child: const Text(
                          'Routes',
                          style:
                              TextStyle(fontSize: 24, color: Color(0xff2C3639)),
                        ),
                      ),
                      Container(
                        height: 250,
                        margin:
                            const EdgeInsets.only(top: 10, right: 5, left: 5),
                        child: SingleChildScrollView(
                          child: Column(
                            children: flightsDetailsController.flightRoutes,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          style: kElevationButtonStyle,
                          onPressed: () {
                            passengersInfo.constructPassengersInfoCard();
                            payment.addPaymentAmount(flightsDetailsController.flightPrice.value.toString());
                            Get.toNamed('/PassengersInformationScreen');
                          },
                          child: const Text('Confirm'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            (flightsDetailsController.showLoadingSpinner.value)
                ? const Spinner()
                : Container(),
          ],
        ),
      ),
    );
  }
}
