import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../Screens/Available Flights Screen/Controllers/available_flights_screen_controller.dart';
import '../../Screens/Flight Details Screen/Controllers/flight_details_screen_controller.dart';
import '../Configurations/colors.dart';

class AvailableFlightsCardRoundTrip extends StatelessWidget {
  AvailableFlightsCardRoundTrip(
      {Key? key,
        required this.departureTime,
        required this.departureCity,
        required this.arrivalCity,
        required this.arrivalTime,
        required this.flightDuration,
        required this.flightPrice,
        required this.handBagWeight,
        required this.checkInBagWeight,
        required this.index,
        required this.returnDate,
      })
      : super(key: key);

  String departureTime;
  String departureCity;
  String arrivalTime;
  String arrivalCity;
  String flightDuration;
  String flightPrice;
  String handBagWeight;
  String checkInBagWeight;
  String returnDate;
  int index;

  final availableFlightsController = Get.find<AvailableFlightsScreenController>();
  final flightsDetailsController = Get.find<FlightDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 350,
      height: 150,
      decoration: BoxDecoration(
          color: const Color(0x4dB1E1FF),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    departureTime,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kMainTextColor,
                    ),
                  ),
                  Text(
                    departureCity,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kMainTextColor,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Text(
                        '..........',
                        style: TextStyle(color: Color(0xff30475E),),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        FontAwesomeIcons.plane,
                        color: Color(0x4d1B2430),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '..........',
                        style: TextStyle(color: Color(0xff30475E),),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    flightDuration,
                    style: const TextStyle(
                        color: Color(0xffA2B5BB), fontSize: 15),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    arrivalTime,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kMainTextColor,
                    ),
                  ),
                  Text(
                    arrivalCity,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kMainTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.suitcaseRolling,
                        color: Color(0xccB09B71),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$handBagWeight Kg',
                        style: const TextStyle(color: Color(0xffB09B71)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.suitcase,
                        color: Color(0x4dE8AA42),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$checkInBagWeight Kg',
                        style: const TextStyle(color: Color(0xccE8AA42)),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'From',
                    style: TextStyle(
                        color: Color(0xff876445), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        availableFlightsController.updateSelectedCardIndex(index);
                        flightsDetailsController.loadFlightDetails();
                        Get.toNamed('/FlightDetailsScreen');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff22577E),
                        onPrimary: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        minimumSize: const Size(50, 40), //////// HERE
                      ),
                      child: Text('$flightPrice USD')),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Return Date On'),
              const SizedBox(width: 8),
              Text(returnDate),
            ],
          ),
        ],
      ),
    );
  }
}
