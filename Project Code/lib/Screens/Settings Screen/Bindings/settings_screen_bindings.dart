import 'package:get/get.dart';
import '../Controller/settings_screen_controller.dart';

final settingsController = Get.find<SettingsScreenController>();

class SettingsScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    settingsController.checkUserEmailVerified();
  }
}