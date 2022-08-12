import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/flight_booking_controller.dart';
import '../Controller/flight_booking_select_tripType_controller.dart';

class SelectTripType extends StatelessWidget {
   SelectTripType({Key? key}) : super(key: key);

   final flightBooking = Get.find<FlightBookingTripTypeController>();
   final flightBookingController = Get.find<FlightBookingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Row(
        children: [
          Container(
            decoration: (flightBooking.oneWay.value)
                ? showSelectedTripBorder
                : const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                const Text(
                  'One Way',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
                Checkbox(
                  activeColor: kTripTypeActiveColor,
                  value: flightBooking.oneWay.value,
                  onChanged: (value) {
                    flightBooking.toggleTripIsRounded();
                  },
                  shape: const CircleBorder(),
                  checkColor: Colors.redAccent,
                  // fillColor: ,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: (flightBooking.roundTrip.value)
                ? showSelectedTripBorder
                : const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                const Text(
                  'Round Trip',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
                Checkbox(
                  activeColor: kTripTypeActiveColor,
                  value: flightBooking.roundTrip.value,
                  onChanged: (value) {
                    flightBooking.toggleTripIsRounded();
                  },
                  shape: const CircleBorder(),
                  checkColor: Colors.redAccent,
                  // fillColor: ,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
