import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../Splash Screen/Controller/splash_screen_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Controller/onboard_screen_controller.dart';
import '../Models/onboard_page_items_constructor.dart';

class OnboardScreen extends StatelessWidget {
   OnboardScreen({Key? key}) : super(key: key);

  final controller = PageController();
   final firstTimeLunchState = Get.find<SplashScreenController>();
   final page = Get.put(OnboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: kAppBackgroundColor,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: PageView(
              onPageChanged: (index) => {
                page.checkLastPage(index),
              },
              controller: controller,
              children: [
                onboardPageItemConstructor(
                  urlImage: 'Images/SplashScreen/splash_screen_image.png',
                  title: 'Flight Booking',
                  subtitle: 'Hold on fast & Book your next journey',
                ),
                onboardPageItemConstructor(
                  urlImage: 'Images/SplashScreen/splash_screen_image.png',
                  title: 'Flight Deals Screen',
                  subtitle: 'A journey of a thousand miles begins with a single step',
                ),
                onboardPageItemConstructor(
                  urlImage: 'Images/SplashScreen/splash_screen_image.png',
                  title: 'Flight Tracking',
                  subtitle: 'Get Constant Updates On The Flight Status',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Obx(
            ()=> (page.isLast.value)?  Container(
              height: 60,
              color: kBottomSheetBackground,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: (){
                    firstTimeLunchState.toggleFirstTimeLunch();
                    Get.offNamed('/LoginScreen');
                  },
                  child: const Center(
                    child: Text('GET STARTED', style: TextStyle(
                      fontSize: 24,
                    ),),
                  ),
                ),
              ),
            ): Container(
              color: kBottomSheetBackground,
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.jumpToPage(2);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('SKIP', style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      ),
                      controller: controller,
                      count: 3,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text('NEXT', style: TextStyle(fontSize: 20),),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}




