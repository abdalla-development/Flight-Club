import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Screens/Available Flights Screen/Controllers/available_flights_response_controller.dart';

class FlightDealsFilterByDayWidgetConstructor extends StatelessWidget {
   FlightDealsFilterByDayWidgetConstructor(
      {Key? key,
      required this.date,
      required this.index})
      : super(key: key);

  final String date;
  final int index;
   final availableFlightsResponse = Get.find<AvailableFlightResponseController>();

  @override
  Widget build(BuildContext context) {

    return Obx(
        ()=> GestureDetector(
        onTap: () {
          availableFlightsResponse.updateRowItemIndex(index);
          print(index);
        },
        child: Container(
          height: 35,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (availableFlightsResponse.itemRowIndex.value == index) ? Colors.grey : Colors.blueGrey,
          ),
          child: Text(date),
        ),
      ),
    );
  }
}
