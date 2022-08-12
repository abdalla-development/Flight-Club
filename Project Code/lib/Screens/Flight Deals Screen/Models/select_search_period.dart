import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/flight_deals_select_date_controller.dart';

class SelectSearchPeriod extends StatelessWidget {
   SelectSearchPeriod({Key? key}) : super(key: key);

   final dealsDate = Get.find<FlightDealsSelectDateController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> ExpansionTile(
        iconColor: Colors.black,
        title: Text(
          dealsDate.selectedPeriod.value,
          style: const TextStyle(
            // color: kFlyClassColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          GestureDetector(
            child: const Text(
              'Next Month',
              style: TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              dealsDate.updateSearchPeriod('Next Month');
            },
          ),
          const SizedBox(height: 3),
          GestureDetector(
            child: const Text(
              'Next 3 Month',
              style: TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              dealsDate.updateSearchPeriod('Next 3 Month');
            },
          ),
          const SizedBox(height: 3),
          GestureDetector(
            child: const Text(
              'Next 6 Month',
              style: TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              dealsDate.updateSearchPeriod('Next 6 Month');
            },
          ),
          const SizedBox(height: 3),
          GestureDetector(
            child: const Text(
              'Next 9 Month',
              style: TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              dealsDate.updateSearchPeriod('Next 9 Month');
            },
          ),
          const SizedBox(height: 3),
          GestureDetector(
            child: const Text(
              'Next Year',
              style: TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              dealsDate.updateSearchPeriod('Next Year');
            },
          ),
          const SizedBox(height: 3),
        ],
      ),
    );
  }
}