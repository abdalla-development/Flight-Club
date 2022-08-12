import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controller/flight_booking_select_passengers_controller.dart';

class SelectPassenger extends StatelessWidget {
  SelectPassenger({Key? key}) : super(key: key);

  final flightBooking = Get.find<FlightBookingPassengersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ExpansionTile(
        iconColor: Colors.black,
        title: (flightBooking.childrenPassengers.value == 0)
            ? (flightBooking.infantsPassengers.value != 0)
                ? Text(
                    '${flightBooking.adultsPassengers.value.toString()} Adults &  ${flightBooking.infantsPassengers.value.toString()} Infants',
                    style: const TextStyle(
                      // color: kAdultsHintTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Text(
                    '${flightBooking.adultsPassengers.value.toString()} Adults',
                    style: const TextStyle(
                      // color: kAdultsHintTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
            : (flightBooking.infantsPassengers.value == 0)
                ? Text(
                    '${flightBooking.adultsPassengers.value.toString()} Adults & ${flightBooking.childrenPassengers.value.toString()} Children',
                    style: const TextStyle(
                      // color: kAdultsHintTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Text(
                    '${flightBooking.adultsPassengers.value.toString()} Adults, ${flightBooking.childrenPassengers.value.toString()} Children & ${flightBooking.infantsPassengers.value.toString()} infants',
                    style: const TextStyle(
                      // color: kAdultsHintTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (flightBooking.adultsPassengers.value > 1) {
                    flightBooking.updateNumberOfAdults(
                        flightBooking.adultsPassengers.value - 1);
                  }
                },
                icon: const Icon(FontAwesomeIcons.minus),
              ),
              Text(flightBooking.adultsPassengers.value.toString()),
              IconButton(
                onPressed: () {
                  flightBooking.updateNumberOfAdults(
                      flightBooking.adultsPassengers.value + 1);
                },
                icon: const Icon(FontAwesomeIcons.plus),
              ),
              const Text('Adults'),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (flightBooking.childrenPassengers.value > 0) {
                    flightBooking.updateNumberOfChildren(
                        flightBooking.childrenPassengers.value - 1);
                  }
                },
                icon: const Icon(FontAwesomeIcons.minus),
              ),
              Text(flightBooking.childrenPassengers.value.toString()),
              IconButton(
                onPressed: () {
                  flightBooking.updateNumberOfChildren(
                      flightBooking.childrenPassengers.value + 1);
                },
                icon: const Icon(FontAwesomeIcons.plus),
              ),
              const Text('Children'),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (flightBooking.infantsPassengers.value > 0) {
                    flightBooking.updateNumberOfInfants(
                        flightBooking.infantsPassengers.value - 1);
                  }
                },
                icon: const Icon(FontAwesomeIcons.minus),
              ),
              Text(flightBooking.infantsPassengers.value.toString()),
              IconButton(
                onPressed: () {
                  flightBooking.updateNumberOfInfants(
                      flightBooking.infantsPassengers.value + 1);
                },
                icon: const Icon(FontAwesomeIcons.plus),
              ),
              const Text('Infants'),
            ],
          ),
        ],
      ),
    );
  }
}
