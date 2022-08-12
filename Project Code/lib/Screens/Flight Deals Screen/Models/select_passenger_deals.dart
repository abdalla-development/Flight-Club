import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controller/flight_deals_select_passengers_controller.dart';

class SelectPassengerDeals extends StatelessWidget {
   SelectPassengerDeals({Key? key}) : super(key: key);

   final dealsPassengers =  Get.find<FlightDealsSelectPassengersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> ExpansionTile(
        iconColor: Colors.black,
        title: (dealsPassengers.childrenPassengers.value == 0)
            ? (dealsPassengers.infantsPassengers.value != 0)
            ? Text(
          '${dealsPassengers.adultsPassengers.value.toString()} Adults &  ${dealsPassengers.infantsPassengers.value.toString()} Infants',
          style: const TextStyle(
            // color: kAdultsHintTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )
            : Text(
          '${dealsPassengers.adultsPassengers.value.toString()} Adults',
          style: const TextStyle(
            // color: kAdultsHintTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )
            : (dealsPassengers.infantsPassengers.value == 0)
            ? Text(
          '${dealsPassengers.adultsPassengers.value.toString()} Adults & ${dealsPassengers.childrenPassengers.value.toString()} Children',
          style: const TextStyle(
            // color: kAdultsHintTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )
            : Text(
          '${dealsPassengers.adultsPassengers.value.toString()} Adults, ${dealsPassengers.childrenPassengers.value.toString()} Children & ${dealsPassengers.infantsPassengers.value.toString()} infants',
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
                  if (dealsPassengers.adultsPassengers.value > 1) {
                    dealsPassengers.updateNumberOfAdults(dealsPassengers.adultsPassengers.value-1);
                  }
                },
                icon: const Icon(FontAwesomeIcons.minus),
              ),
              Text(dealsPassengers.adultsPassengers.value.toString()),
              IconButton(
                onPressed: () {
                  dealsPassengers.updateNumberOfAdults(dealsPassengers.adultsPassengers.value+1);
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
                  if (dealsPassengers.childrenPassengers.value > 0) {
                    dealsPassengers.updateNumberOfChildren(dealsPassengers.childrenPassengers.value-1);
                  }
                },
                icon: const Icon(FontAwesomeIcons.minus),
              ),
              Text(dealsPassengers.childrenPassengers.value.toString()),
              IconButton(
                onPressed: () {
                  dealsPassengers.updateNumberOfChildren(dealsPassengers.childrenPassengers.value+1);
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
                  if (dealsPassengers.infantsPassengers.value > 0) {
                    dealsPassengers.updateNumberOfInfants(dealsPassengers.infantsPassengers.value-1);
                  }
                },
                icon: const Icon(FontAwesomeIcons.minus),
              ),
              Text(dealsPassengers.infantsPassengers.value.toString()),
              IconButton(
                onPressed: () {
                  dealsPassengers.updateNumberOfInfants(dealsPassengers.infantsPassengers.value+1);
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