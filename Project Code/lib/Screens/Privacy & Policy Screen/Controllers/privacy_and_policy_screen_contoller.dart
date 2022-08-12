import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class PrivacyAndPolicyScreenController extends GetxController{

  final drawerController = AdvancedDrawerController();

  void toggleDrawer(){
    drawerController.toggleDrawer();
  }

}