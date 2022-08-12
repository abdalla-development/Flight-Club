import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/API Requests/flight_tracking_request.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controllers/flight_tracking_screen_controller.dart';
import '../Models/flight_tracking_flightNumber_textField.dart';
import '../Models/flight_tracking_map_background.dart';

class FlightTrackingScreen extends StatelessWidget {
  FlightTrackingScreen({Key? key}) : super(key: key);

  // final flightTrackingController = Get.put(FlightTrackingScreenController());
  final flightTrackingController = Get.find<FlightTrackingScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> AdvancedDrawer(
        backdropColor: kDrawerBackgroundColor,
        controller: flightTrackingController.drawerController,
        openScale: 0.95,
        openRatio: 0.80,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        drawer:  CustomDrawer(),
        child: Stack(
          children: [
            Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              appBar: customAppBar(
                  usingTitle: true,
                  onPressed: (){
                    flightTrackingController.toggleDrawer();
                  },
                  leadingIcon: const Icon(
                    FontAwesomeIcons.bars,
                    color: Colors.black54,
                  ),
                  title: 'Flight Tracking',
              ),
              body: Container(
                decoration: kAppBackgroundColor,
                child: SafeArea(
                  child: Stack(
                    children: [
                      FlightTrackingMapBackground(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.6)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlightTrackingFlightNumberTextField(),
                            const SizedBox(height: 20,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff22577E),
                                onPrimary: Colors.white,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                minimumSize: const Size(250, 40), //////// HERE
                              ),
                              onPressed: () {
                                flightTrackingController.checkFlightNumberIsValid();
                                if(flightTrackingController.flightNumberValid.value){
                                  // request data show spinner
                                  trackFlight(flightTrackingController.flightNumber.value);
                                  Get.toNamed('/TrackedFlightScreen');
                                }else {
                                  Get.snackbar(
                                    '',
                                    'Please Provide A Valid Flight Number',
                                    titleText: const Text('Invalid Flight Number', style: TextStyle(color: Colors.red),),
                                    borderRadius: 20,
                                    margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
                                    // backgroundColor: ,
                                    // backgroundGradient: ,
                                    borderColor: Colors.blueGrey,
                                    borderWidth: 2,
                                    duration: const Duration(milliseconds: 3000),
                                    icon: const Icon(FontAwesomeIcons.circleXmark, color: Colors.red,),
                                  );
                                }
                              },
                              child: const Text(
                                'Track',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar:  CustomBottomNavigationBar(),
            ),
            (flightTrackingController.showLoadingSpinner.value) ? const Spinner() : Container(),
          ],
        ),
      ),
    );
  }
}
