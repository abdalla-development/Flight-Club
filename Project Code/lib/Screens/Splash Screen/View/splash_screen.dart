import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../Login Screen/View/login_screen.dart';
import '../../Onboard Screen/View/onboard_screen.dart';
import '../Controller/splash_screen_controller.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  final firstTimeLunchState = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: kAppBackgroundColor,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Image.asset(
                      'Images/SplashScreen/splash_screen_image.png',
                      scale: 1,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  child: Image.asset(
                    'Images/SplashScreen/kiwi_icon.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      nextScreen: Obx(
            ()=> (firstTimeLunchState.status.isTrue)?  OnboardScreen():  LoginScreen(),
      ),
      splashIconSize: MediaQuery.of(context).size.height,
      splashTransition: SplashTransition.fadeTransition,
      duration: 4000,
      animationDuration: const Duration(seconds: 3),
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
    );
  }
}


