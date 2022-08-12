import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:get/get.dart';
import '../../Screens/Home Screen/Controllers/home_screen_controller.dart';
import '../Configurations/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
   CustomBottomNavigationBar({Key? key}) : super(key: key);

   final homeScreen = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return CircularBottomNavigation(
      homeScreen.tabItems,
      controller: homeScreen.navigationController,
      barBackgroundColor: kBottomSheetBackground,

      selectedCallback: (index){
        if(index==0){
          homeScreen.updateBottomNavBarIndex(0);
          Get.offNamed('/FlightBookingScreen');
        }else if(index==1){
          homeScreen.updateBottomNavBarIndex(1);
          Get.offNamed('/FlightDealsScreen');
        }else if(index==2){
          homeScreen.updateBottomNavBarIndex(2);
          Get.offNamed('/FlightTrackingScreen');
        }
      },
      // normalIconColor: Colors.grey,
    );
  }
}

