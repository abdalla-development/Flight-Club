import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class FavouritesScreenController extends GetxController{

  final drawerController = AdvancedDrawerController();

  void toggleDrawer(){
    drawerController.toggleDrawer();
  }

  void hideDrawer(){
    drawerController.hideDrawer();
  }
}