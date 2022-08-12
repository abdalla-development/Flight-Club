import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class RateAppScreenController extends GetxController{
  final drawerController = AdvancedDrawerController();
  final appLikeRate = 1.0.obs;
  final appEasyToUseRate = 1.0.obs;
  final appUserSatisfactionRate = 1.0.obs;

  void toggleDrawer(){
    drawerController.toggleDrawer();
  }

  void hideDrawer(){
    drawerController.hideDrawer();
  }

  void updateAppLikeRate(double value){
    appLikeRate.value = value;
  }

  void updateAppEasyToUseRating(double value){
    appEasyToUseRate.value = value;
  }

  void updateAppUserSatisfactionRating(double value){
    appUserSatisfactionRate.value = value;
  }
}