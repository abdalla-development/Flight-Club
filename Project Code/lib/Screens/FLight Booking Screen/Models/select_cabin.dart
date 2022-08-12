import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/flight_booking_select_cabin_controller.dart';

class SelectClassCabin extends StatelessWidget {
  SelectClassCabin({Key? key}) : super(key: key);

  final flightBooking = Get.find<FlightBookingCabinController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ExpansionTile(
        iconColor: Colors.black,
        title: Text(
          flightBooking.selectedClassType.value,
          style: const TextStyle(
            // color: kFlyClassColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          GestureDetector(
            child: const Text(
              'Economy',
              style: TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              flightBooking.updateSelectedClass('Economy');
            },
          ),
          const SizedBox(
            height: 3,
          ),
          GestureDetector(
            child: const Text(
              'Economy Premium',
              style: TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              flightBooking.updateSelectedClass('Economy Premium');
            },
          ),
          const SizedBox(
            height: 3,
          ),
          GestureDetector(
            child: const Text(
              'Business Class',
              style: TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              flightBooking.updateSelectedClass('Business Class');
            },
          ),
          const SizedBox(
            height: 3,
          ),
          GestureDetector(
            child: const Text(
              'First Class',
              style: TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              flightBooking.updateSelectedClass('First Class');
            },
          ),
        ],
      ),
    );
  }
}
