import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controllers/flight_details_screen_controller.dart';

class FlightDetailsMainFlightInfo extends StatelessWidget {
   FlightDetailsMainFlightInfo({Key? key}) : super(key: key);

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
              children:  [
                Text(flightsDetailsController.departureCityCode.value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xccE2DCC8),),),
                Text(flightsDetailsController.departureCity.value, style: const TextStyle(fontSize: 20, color: Color(0xe6FEFBF6),),),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text(
                    '..........',
                    style: TextStyle(color: Color(0x4dCBA0AE)),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    FontAwesomeIcons.plane,
                    color: Color(0x4dCBA0AE),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '..........',
                    style: TextStyle(color: Color(0x4dCBA0AE)),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                flightsDetailsController.flightDuration.value,
                style: const TextStyle(
                    color: Color(0xffA5C9CA),
                    fontSize: 18),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, right: 15),
            child: Column(
              children: [
                Text(flightsDetailsController.arrivalCityCode.value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xccE2DCC8)),),
                Text(flightsDetailsController.arrivalCity.value, style: const TextStyle(fontSize: 20, color: Color(0xe6FEFBF6)),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
