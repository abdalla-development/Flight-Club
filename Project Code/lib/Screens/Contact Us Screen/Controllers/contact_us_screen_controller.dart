import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class ContactUsScreenController extends GetxController{
  final drawerController = AdvancedDrawerController();
  final messageTitle = ''.obs;
  final messageBody = ''.obs;

  void toggleDrawer(){
    drawerController.toggleDrawer();
  }

  void updateMessageTitle(String value){
    messageTitle.value = value;
  }

  void updateMessageBody(String value){
    messageBody.value = value;
  }
}