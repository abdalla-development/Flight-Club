import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../Controllers/privacy_and_policy_screen_contoller.dart';

class PrivacyAndPolicyScreen extends StatelessWidget {
   PrivacyAndPolicyScreen({Key? key}) : super(key: key);

   final privacyAndPolicyScreenController = Get.find<PrivacyAndPolicyScreenController>();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: kDrawerBackgroundColor,
      controller: privacyAndPolicyScreenController.drawerController,
      openScale: 0.95,
      openRatio: 0.80,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      drawer:  CustomDrawer(),
      child: Stack(
        children: [
          Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(
              usingTitle: true,
              leadingIcon: const Icon(
                FontAwesomeIcons.bars,
                color: Colors.black54,
              ),
              title: 'Privacy & Policy',
              onPressed: () {
                privacyAndPolicyScreenController.toggleDrawer();
              },
            ),
            body: Container(
              decoration: kAppBackgroundColor,
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children:  [
                      const CircleAvatar(
                        radius: 80,
                        child: Image(
                          image: AssetImage(
                              'Images/PrivacyPolicyScreen/privacy_policy_screen_icon.png'),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0x33F1EEE9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 530,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        width: MediaQuery.of(context).size.width,
                        child: const SingleChildScrollView(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
