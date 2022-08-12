import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controller/settings_screen_controller.dart';

class SettingsScreenNotificationListTile extends StatelessWidget {
   SettingsScreenNotificationListTile({Key? key}) : super(key: key);

   final settingsController = Get.find<SettingsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListTile(
          leading: const Icon(FontAwesomeIcons.bell),
          trailing: (settingsController
              .showNotificationsSettings.value)
              ? const Icon(FontAwesomeIcons.angleUp)
              : const Icon(FontAwesomeIcons.angleDown),
          title: const Text('Notifications Settings'),
          onTap: () {
            settingsController.toggleNotificationsSettings();
          },
        ),
      ),
    );
  }
}
