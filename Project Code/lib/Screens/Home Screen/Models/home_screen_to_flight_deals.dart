import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/home_screen_controller.dart';
import 'home_page_sliding_items.dart';

class HomeScreenToFlightDeals extends StatelessWidget {
   HomeScreenToFlightDeals({Key? key}) : super(key: key);

   final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // homeScreenController.toggleLoadingSpinner();
        homeScreenController.updateBottomNavBarIndex(1);
        Get.toNamed('/FlightDealsScreen');
        // homeScreenController.toggleLoadingSpinner();
      },
      child: const CustomSlidingHomePageItems(
        titleText: 'Flight Deals',
        imageUrl:
        'Images/HomeScreen/home_flight_deals_icon.png',
      ),
    );
  }
}
