import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/flight_deals_controller.dart';
import '../Controller/flight_deals_select_tripType_controller.dart';

class SelectTripTypeDeals extends StatelessWidget {
   SelectTripTypeDeals({
    Key? key,
  }) : super(key: key);

   final dealsController = Get.find<FlightDealsScreenController>();
   final dealsTrip = Get.find<FlightDealsSelectTripTypeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: (dealsTrip.oneWay.value)
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
                    value: dealsTrip.oneWay.value,
                    onChanged: (value) {
                      dealsTrip.toggleTripIsRounded();
                    },
                    shape: const CircleBorder(),
                    checkColor: Colors.redAccent,
                    // fillColor: ,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              decoration: (dealsTrip.roundTrip.value)
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
                    value: dealsTrip.roundTrip.value,
                    onChanged: (value) {
                      dealsTrip.toggleTripIsRounded();
                    },
                    shape: const CircleBorder(),
                    checkColor: Colors.redAccent,
                    // fillColor: ,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
