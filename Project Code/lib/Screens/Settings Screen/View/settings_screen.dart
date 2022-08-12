import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';
import '../Controller/settings_screen_controller.dart';
import '../Models/account_settings_widget.dart';
import '../Models/notifications_settings_widget.dart';
import '../Models/settings_screen_account_listTile.dart';
import '../Models/settings_screen_contactUs_listTile.dart';
import '../Models/settings_screen_icon.dart';
import '../Models/settings_screen_notification_listTile.dart';
import '../Models/settings_screen_privacyPolicy_listTile.dart';
import '../Models/settings_screen_termsConditions_listTile.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final settingsController = Get.find<SettingsScreenController>();
  final homeController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(
              usingTitle: true,
              onPressed: () {
                homeController.hideDrawer();
                Get.offNamed('/HomeScreen');
              },
              leadingIcon: const Icon(
                FontAwesomeIcons.house,
                color: Colors.black54,
              ),
              title: 'Settings',
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: kAppBackgroundColor,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SettingsScreenIcon(),
                      const SizedBox(height: 25,),
                      SettingsScreenAccountListTile(),
                      (settingsController.showAccountSettings.value)
                          ? AccountSettingsWidget()
                          : Container(),
                      const SizedBox(height: 8,),
                      SettingsScreenNotificationListTile(),
                      (settingsController.showNotificationsSettings.value)
                          ? NotificationsSettingsWidget()
                          : Container(),
                      const SizedBox(height: 8,),
                      const SettingsScreenPrivacyPolicyListTile(),
                      const SizedBox(height: 8,),
                      const SettingsScreenTermsConditionsListTile(),
                      const SizedBox(height: 8,),
                      const SettingsScreenContactUsListTile(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          (settingsController.showLoadingSpinner.value)
              ? const Spinner()
              : Container(),
        ],
      ),
    );
  }
}
