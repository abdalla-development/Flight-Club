import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/home_screen_controller.dart';
import 'home_page_sliding_items.dart';

class HomeScreenToFlightTracking extends StatelessWidget {
   HomeScreenToFlightTracking({Key? key}) : super(key: key);

   final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeScreenController.toggleLoadingSpinner();
        homeScreenController.updateBottomNavBarIndex(2);
        Get.toNamed('/FlightTrackingScreen');
        homeScreenController.toggleLoadingSpinner();
      },
      child: const CustomSlidingHomePageItems(
        titleText: 'Flight Tracking',
        imageUrl:
        'Images/HomeScreen/home_flight_tracking_icon.jpg',
      ),
    );
  }
}
