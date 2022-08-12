import 'package:get/get.dart';
import '../Controllers/home_screen_controller.dart';

final homeScreenController = Get.find<HomeScreenController>();

class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    homeScreenController.getUserAvatar();
    homeScreenController.getCurrentUserData();
  }
}