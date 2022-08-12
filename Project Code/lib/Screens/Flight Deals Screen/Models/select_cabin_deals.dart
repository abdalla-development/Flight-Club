import 'package:flight_booking/Screens/Flight%20Deals%20Screen/Controller/flight_deals_request_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/flight_deals_select_cabin_controller.dart';

class SelectClassCabinDeals extends StatelessWidget {
   SelectClassCabinDeals({Key? key}) : super(key: key);

   final dealsCabin =  Get.find<FlightDealsSelectCabinController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> ExpansionTile(
        iconColor: Colors.black,
        title: Text(
          dealsCabin.selectedClassType.value,
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
              dealsCabin.updateSelectedClass('Economy');
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
              dealsCabin.updateSelectedClass('Economy Premium');
            },
          ),
          const SizedBox(
            height: 3,
          ),
          GestureDetector(
            child: const Text(
              'Business',
              style: TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              dealsCabin.updateSelectedClass('Business Class');
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
              dealsCabin.updateSelectedClass('First Class');
            },
          ),
        ],
      ),
    );
  }
}

