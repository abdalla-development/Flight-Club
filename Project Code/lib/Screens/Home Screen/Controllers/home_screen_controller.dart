import 'dart:convert';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../../../Utilities/API Requests/get_international_airports_list_request.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../Login Screen/Controller/login_screen_controller.dart';

final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
final loginScreenController = Get.find<LoginScreenController>();

class HomeScreenController extends GetxController{

  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    getAirportData();
    getUserAvatar();
  }

  final showLoadingSpinner = false.obs;
  final drawerController = AdvancedDrawerController();
  final commercialAirportsList = [].obs;
  final suggestionsCitiesDeparture = [].obs;
  final suggestionsCitiesArrival = [].obs;
  final bottomNavBarHeight = 60.obs;
  final selectedPos = 0.obs;
  final CircularBottomNavigationController navigationController = CircularBottomNavigationController(0);
  List<TabItem> tabItems = List.of([
    TabItem(FontAwesomeIcons.planeCircleCheck, "Flight Booking", const Color(0xff3A3845), labelStyle: const TextStyle(fontWeight: FontWeight.normal),),
    TabItem(Icons.price_change, "Flight Deals", const Color(0xffA13333), labelStyle: const TextStyle(fontWeight: FontWeight.bold),),
    TabItem(FontAwesomeIcons.magnifyingGlassLocation, "Flight Track", const Color(0xff8E806A), labelStyle: const TextStyle(fontWeight: FontWeight.bold),),
  ]).obs;

  final bookingDeals = ''.obs;
  final userAvatar = 'https://icon-library.com/images/free-user-icon/free-user-icon-26.jpg'.obs;
  final userFirstName = ''.obs;
  final userLastName = ''.obs;
  final userUsername = ''.obs;
  final userEmail = ''.obs;

  void callingScreen(String value){
    bookingDeals.value = value;
  }

  void toggleLoadingSpinner(){
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void toggleDrawer(){
    drawerController.toggleDrawer();
  }

  void hideDrawer(){
    drawerController.hideDrawer();
  }

  void updateCommercialAirportsList(List airportsList){
    commercialAirportsList.value = airportsList;
    suggestionsCitiesDeparture.value = airportsList;
    suggestionsCitiesArrival.value = airportsList;
  }

  void updateBottomNavBarIndex(int index){
    // selectedPos.value = index;
    navigationController.value = index;
  }

  void getUserAvatar() async{
    try{
      userAvatar.value = await storage.ref('UsersAvatar/${loginScreenController.currentLoggedInUser.value}').getDownloadURL();
    }on FirebaseException catch (e){
      userAvatar.value = 'https://icon-library.com/images/free-user-icon/free-user-icon-26.jpg';
    }
  }

  void getCurrentUserData() async{
    final snapShot = await FirebaseFirestore.instance.collection('Users').doc(loginScreenController.currentLoggedInUser.value).get();
    userFirstName.value = snapShot.data()!['First Name'];
    userLastName.value = snapShot.data()!['Last Name'];
    userUsername.value = snapShot.data()!['Username'];
  }

  void loadCurrentUserEmail(String value){
    userEmail.value = value;
  }
}
// TabItem(FontAwesomeIcons.ticket, "My Tickets", const Color(0xff464E2E), labelStyle: const TextStyle(fontWeight: FontWeight.bold),),
// TabItem(FontAwesomeIcons.camera, "Translate", const Color(0xe36E85B7), labelStyle: const TextStyle(fontWeight: FontWeight.bold),),
// TabItem(FontAwesomeIcons.microphone, "Translate", const Color(0xe3F8B400), labelStyle: const TextStyle(fontWeight: FontWeight.bold),),