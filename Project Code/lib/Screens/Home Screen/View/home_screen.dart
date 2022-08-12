import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Login Screen/Controller/login_screen_controller.dart';
import '../Controllers/home_screen_controller.dart';
import '../Models/home_screen_background_image.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../Models/home_screen_to_flight_booking.dart';
import '../Models/home_screen_to_flight_deals.dart';
import '../Models/home_screen_to_flight_tracking.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeScreenController = Get.find<HomeScreenController>();
  // final homeScreenController = Get.put(HomeScreenController());
  final loginScreenController = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AdvancedDrawer(
        backdropColor: kDrawerBackgroundColor,
        controller: homeScreenController.drawerController,
          openScale: 0.95,
        openRatio: 0.80,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        drawer:  CustomDrawer(),
        child: Stack(
          children: [
            const HomeScreenBackgroundImage(),
            Scaffold(
              resizeToAvoidBottomInset: false,
              extendBody: true,
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.black54,
              appBar: customAppBar(
                usingTitle: true,
                leadingIcon: const Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.black54,
                ),
                title: 'Home',
                onPressed: () {
                  homeScreenController.toggleDrawer();
                },
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: DefaultTextStyle(
                    style: GoogleFonts.raleway(
                        // color: Colors.white,
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          'Hello ${homeScreenController.userFirstName.value}',
                          style: const TextStyle(fontSize: 30),
                        ),
                        const SizedBox(height: 5),
                        // const SizedBox(height: 45),
                        const SizedBox(height: 200),
                        const SizedBox(height: 40),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomeScreenToFlightBooking(),
                              const SizedBox(width: 30),
                              HomeScreenToFlightDeals(),
                              const SizedBox(width: 30),
                              HomeScreenToFlightTracking(),
                              const SizedBox(width: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // bottomSheet: ,
            ),
            (homeScreenController.showLoadingSpinner.value)
                ? const Spinner()
                : Container(),
          ],
        ),
      ),
    );
  }
}
