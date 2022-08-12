import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/home_screen_controller.dart';
import 'home_page_sliding_items.dart';

class HomeScreenToFlightBooking extends StatelessWidget {
   HomeScreenToFlightBooking({Key? key}) : super(key: key);

   final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeScreenController.toggleLoadingSpinner();
        homeScreenController.updateBottomNavBarIndex(0);
        Get.toNamed('/FlightBookingScreen');
        homeScreenController.toggleLoadingSpinner();
      },
      child: const CustomSlidingHomePageItems(
        titleText: 'Flight Booking',
        imageUrl:
        'Images/HomeScreen/home_flight_booking_icon.jpg',
      ),
    );
  }
}
