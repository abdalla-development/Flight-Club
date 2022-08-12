import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Controllers/flight_details_screen_controller.dart';

class FlightDetailsFlightGeneralInfo extends StatelessWidget {
   FlightDetailsFlightGeneralInfo({Key? key}) : super(key: key);

   final flightsDetailsController = Get.find<FlightDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        margin: const EdgeInsets.only(top: 10, right: 15, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text('Price', style: TextStyle(fontSize: 18, color: Color(0xe6FAD9A1)),),
                Text('${flightsDetailsController.flightPrice.value} USD', style: const TextStyle(fontSize: 16, color: Color(0xd9B2C8DF)),),
              ],
            ),
            Column(
              children: [
                const Text('Stops', style: TextStyle(fontSize: 18, color: Color(0xe6FAD9A1)),),
                Text(flightsDetailsController.flightStops.toString(), style: const TextStyle(fontSize: 16, color: Color(0xd9B2C8DF)),),
              ],
            ),
            Column(
              children: [
                const Text('Fly Class', style: TextStyle(fontSize: 18, color: Color(0xe6FAD9A1)),),
                Text(flightsDetailsController.flightClass.value, style: const TextStyle(fontSize: 16, color: Color(0xd9B2C8DF)),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
