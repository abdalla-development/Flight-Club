import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controller/settings_screen_controller.dart';

class NotificationsSettingsWidget extends StatelessWidget {
   NotificationsSettingsWidget({Key? key}) : super(key: key);

   final settingsController = Get.find<SettingsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> SizedBox(
        height: 75,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(4),
          child: Column(
            children:  [
              ListTile(
                leading: (settingsController.notificationsOn.value)? const Icon(FontAwesomeIcons.bell) : const Icon(FontAwesomeIcons.bellSlash),
                title: const Text('Notifications Alert'),
                trailing: CupertinoSwitch(
                  onChanged: (bool value) {
                    settingsController.toggleNotifications(value);
                  },
                  value: settingsController.notificationsOn.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
