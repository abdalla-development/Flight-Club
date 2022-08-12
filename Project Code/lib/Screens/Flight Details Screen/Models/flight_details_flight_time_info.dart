import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Controllers/flight_details_screen_controller.dart';

class FlightDetailsFlightTimeInfo extends StatelessWidget {
   FlightDetailsFlightTimeInfo({Key? key}) : super(key: key);

   final flightsDetailsController = Get.find<FlightDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, left: 15),
            child: Column(
              children: [
                const Text(
                  'Departure Time',
                  style: TextStyle(
                      fontSize: 15, color: Color(0xccB09B71)),
                ),
                Text(
                  flightsDetailsController.departureTime.value,
                  style: const TextStyle(
                      fontSize: 18, color: Color(0xccE8AA42)),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, right: 15),
            child: Column(
              children: [
                const Text(
                  'Arrival Time',
                  style: TextStyle(
                      fontSize: 15, color: Color(0xccB09B71)),
                ),
                Text(
                  flightsDetailsController.arrivalTime.value,
                  style: const TextStyle(
                      fontSize: 18, color: Color(0xccE8AA42)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
