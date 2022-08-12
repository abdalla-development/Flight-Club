import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/send_contact_us_email.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../Controllers/contact_us_screen_controller.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: kDrawerBackgroundColor,
      controller: contactUsScreenController.drawerController,
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
              title: 'Contact Us',
              onPressed: () {
                contactUsScreenController.toggleDrawer();
              },
            ),
            body: Container(
              decoration: kAppBackgroundColor,
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 80,
                        child: Image(
                          image: AssetImage(
                              'Images/ContactUsScreen/contact_us_icon.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Message Title',
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          contactUsScreenController.updateMessageTitle(value);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Message',
                        ),
                        minLines: 7,
                        maxLines: 8,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          contactUsScreenController.updateMessageBody(value);
                        },
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                        style: kElevationButtonStyle,
                        onPressed: () {
                          sendContactUsEmail();
                        },
                        child: const Text('Send'),
                      )
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
