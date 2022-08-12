import 'package:flight_booking/Utilities/API%20Requests/flight_tracking_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marker_icon/marker_icon.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/map_configuration.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controllers/tracked_flight_screen_controller.dart';

class TrackedFlightScreen extends StatelessWidget {
   TrackedFlightScreen({Key? key}) : super(key: key);

   final trackedController = Get.find<TrackedFlightScreenController>();
   final GlobalKey globalKey = GlobalKey();
   final iconData = FontAwesomeIcons.plane;
   void _onMapCreated(GoogleMapController controller) {
     controller.setMapStyle(MapsStyle.mapStyle);
   }


  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> AdvancedDrawer(
          backdropColor: kDrawerBackgroundColor,
          controller: trackedController.drawerController,
          openScale: 0.95,
          openRatio: 0.80,
          childDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          drawer:  CustomDrawer(),
          child: Stack(
          children: [
            Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              resizeToAvoidBottomInset: true,
              appBar: customAppBar(
                usingTitle: true,
                onPressed: (){
                  trackedController.toggleDrawer();
                },
                leadingIcon: const Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.black54,
                ),
                title: 'Flight Information',
              ),
              body: Container(
                decoration: kAppBackgroundColor,
                child: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 8),
                    height: MediaQuery.of(context).size.height,
                    // color: kContainerColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Flight Number', style: TextStyle(fontSize: 22),),
                            Text(trackedController.flightNumber.value, style: const TextStyle(fontSize: 22),),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 25, left: 5, right: 5),
                              padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                              decoration: const BoxDecoration(
                                color: Color(0x44FCF8E8),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(trackedController.departureCityCode.value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                          // Text(trackedController.departureCity.value, style: const TextStyle(fontSize: 20),),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Text('--------------', style: TextStyle(fontSize: 18),),
                                              Icon(FontAwesomeIcons.plane),
                                              Text('-------------', style: TextStyle(fontSize: 18)),
                                            ],
                                          ),
                                          const SizedBox(height: 4,),
                                          Text(trackedFlight.flightDuration.value, style: const TextStyle(fontSize: 16),),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(trackedController.destinationCityCode.value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                          // Text(trackedController.destinationCity.value, style: const TextStyle(fontSize: 20),),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Departed at ${trackedController.departureActualTime.value}', style: const TextStyle(fontSize: 16),),
                                      Text('Arriving at ${trackedController.estimatedArrivalTime.value}', style: const TextStyle(fontSize: 16),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              color: const Color(0x44FCF8E8),
                              height: 430,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GoogleMap(
                                      markers: trackedController.markers,
                                      mapType: MapType.terrain,
                                      zoomGesturesEnabled: false,
                                      compassEnabled: true,
                                      myLocationEnabled: false,
                                      myLocationButtonEnabled: false,
                                      onMapCreated: _onMapCreated,
                                      onCameraMove: (CameraPosition position) {
                                        trackedController.latitude.value = position.target.latitude;
                                        trackedController.longitude.value = position.target.longitude;
                                      },
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(trackedController.latitude.value, trackedController.longitude.value),
                                      ),),
                                  ),
                                  const SizedBox(height: 4,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children:  [
                                            const Text('Status', style: TextStyle(fontSize: 19),),
                                            const SizedBox(height: 4,),
                                            Text(trackedController.flightStatus.value, style: const TextStyle(fontSize: 15),),
                                          ],
                                        ),
                                        Column(
                                          children:  [
                                            const Text('Direction', style: TextStyle(fontSize: 19),),
                                            const SizedBox(height: 4,),
                                            Text(trackedController.aircraftDirection.value.toString(), style: const TextStyle(fontSize: 15),),
                                          ],
                                        ),
                                        Column(
                                          children:  [
                                            const Text('Registration', style: TextStyle(fontSize: 19),),
                                            const SizedBox(height: 4,),
                                            Text(trackedController.aircraftRegistration.value, style: const TextStyle(fontSize: 15),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              padding: const EdgeInsets.only(right: 8, left: 8, top: 5, bottom: 8),
                              decoration: const BoxDecoration(
                                  color: Color(0x44FCF8E8),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Icon(FontAwesomeIcons.gaugeHigh),
                                      const Text('H Speed', style: TextStyle(fontSize: 17),),
                                      const SizedBox(height: 4,),
                                      Text(trackedController.aircraftHorizontalSpeed.value.toString(), style: const TextStyle(fontSize: 14),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Icon(FontAwesomeIcons.arrowUpFromGroundWater),
                                      const Text('Altitude', style: TextStyle(fontSize: 17),),
                                      const SizedBox(height: 4,),
                                      Text(trackedController.aircraftAltitude.value.toString(), style: const TextStyle(fontSize: 14),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Icon(FontAwesomeIcons.gaugeHigh),
                                      const Text('V Speed', style: TextStyle(fontSize: 17),),
                                      const SizedBox(height: 4,),
                                      Text(trackedController.aircraftVerticalSpeed.value.toString(), style: const TextStyle(fontSize: 14),),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar:  CustomBottomNavigationBar(),
            ),
            (trackedController.showLoadingSpinner.value) ? const Spinner() : Container(),
          ],
      ),
        ),
    );
  }
}