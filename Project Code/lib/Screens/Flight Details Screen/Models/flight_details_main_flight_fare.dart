import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Controllers/flight_details_screen_controller.dart';

class FlightDetailsMainFlightFare extends StatelessWidget {
   FlightDetailsMainFlightFare({Key? key}) : super(key: key);

   final flightsDetailsController = Get.find<FlightDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        margin: const EdgeInsets.only(top: 10, right: 60, left: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Adult Fare', style: TextStyle(fontSize: 18),),
                const SizedBox(width: 10,),
                Text('${flightsDetailsController.adultFare.value.toString()} USD', style: const TextStyle(fontSize: 18),),
              ],
            ),
            (flightsDetailsController.children.value!=0)?Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text('Children Fare', style: TextStyle(fontSize: 18),),
                const SizedBox(width: 10,),
                Text('${flightsDetailsController.childrenFare.value.toString()} USD', style: const TextStyle(fontSize: 18),),
              ],
            ):Container(),
            (flightsDetailsController.children.value!=0)?Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Infants Fare', style: TextStyle(fontSize: 18),),
                const SizedBox(width: 10,),
                Text('${flightsDetailsController.infantsFare.value.toString()} USD', style: const TextStyle(fontSize: 18),),
              ],
            ):Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Fare', style: TextStyle(fontSize: 18),),
                const SizedBox(width: 10,),
                Text('${flightsDetailsController.flightPrice.value.toString()} USD', style: const TextStyle(fontSize: 18),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
