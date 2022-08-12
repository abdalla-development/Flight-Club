import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controllers/flight_tracking_screen_controller.dart';

class FlightTrackingFlightNumberTextField extends StatelessWidget {
  FlightTrackingFlightNumberTextField({Key? key}) : super(key: key);

  final flightTracking = Get.find<FlightTrackingScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(FontAwesomeIcons.planeCircleExclamation),
          hintText: 'Please Enter The Flight Number',
          labelText: (flightTracking.flightNumberLabel.value == '')
              ? null
              : flightTracking.flightNumberLabel.value,
          labelStyle: const TextStyle(color: Colors.red),
          iconColor: Colors.black,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusColor: Colors.black,
        ),
        keyboardType: TextInputType.streetAddress,
        onChanged: (value) {
          flightTracking.updateFlightNumber(value);
          flightTracking.updateFlightNumberLabel('');
        },
      ),
    );
  }
}
