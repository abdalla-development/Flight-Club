import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Methods/Firebase Request/verify_currentUser_email.dart';
import '../Controller/settings_screen_controller.dart';

class AccountSettingsWidget extends StatelessWidget {
   AccountSettingsWidget({Key? key}) : super(key: key);

   final settingsController = Get.find<SettingsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> SizedBox(
        height: 125,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(FontAwesomeIcons.unlockKeyhole),
                title: const Text('Change Password'),
                trailing: const Icon(FontAwesomeIcons.angleRight),
                onTap: () {
                  Get.toNamed('/ChangeMyPasswordScreen');
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.idBadge),
                title: const Text('Email Verification'),
                trailing: GestureDetector(
                  onTap: () {
                    // verifyCurrentUserEmail();
                    settingsController.checkUserEmailVerified();
                  },
                  child:(settingsController.userEmailIsVerified.value)? const Text('Verified', style: TextStyle(color: Colors.greenAccent),) :  const Text('Verify', style: TextStyle(color: Colors.amber),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
