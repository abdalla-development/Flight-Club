import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../Utilities/Configurations/map_configuration.dart';
import '../Controllers/flight_tracking_screen_controller.dart';

class FlightTrackingMapBackground extends StatelessWidget {
  FlightTrackingMapBackground({Key? key}) : super(key: key);

  final flightTrackingController = Get.find<FlightTrackingScreenController>();
  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MapsStyle.mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: GoogleMap(
        mapType: MapType.normal,
        zoomGesturesEnabled: false,
        compassEnabled: true,
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        onMapCreated: _onMapCreated,
        onCameraMove: (CameraPosition position) {
          flightTrackingController.updateLatitude(position.target.latitude);
          flightTrackingController.updateLongitude(position.target.longitude);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(flightTrackingController.latitude.value,
              flightTrackingController.longitude.value),
        ),
      ),
    );
  }
}
