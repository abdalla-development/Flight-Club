import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import '../../Screens/Favourites Screen/Controller/favourites_screen_controller.dart';
import '../../Screens/Home Screen/Controllers/home_screen_controller.dart';
import '../../Screens/Rate App Screen/Controller/rate_app_screen_controller.dart';
import '../Configurations/colors.dart';
import 'drawer_user_info_card.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({
    Key? key,
  }) : super(key: key);

   final homeController = Get.find<HomeScreenController>();
   final favouritesController = Get.find<FavouritesScreenController>();
   final rateController = Get.find<RateAppScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            children: [
               UserCardConstructor(
                userEmail: homeController.userEmail.value,
                userPhotoUrl: homeController.userAvatar.value,
                username: '${homeController.userFirstName.value} ${homeController.userLastName.value}',
              ),
              const SizedBox(height: 20,),
              ListTile(
                onTap: () {
                  homeController.hideDrawer();
                  Get.toNamed('/HomeScreen');
                },
                leading: const Icon(Icons.house, color: kDrawerIconColor,),
                title: const Text('Home', style: TextStyle(fontSize: 18, color: kDrawerTextColor,),),
              ),
              ListTile(
                onTap: () {
                  favouritesController.hideDrawer();
                  Get.toNamed('/FavouritesScreen');
                },
                leading: const Icon(Icons.favorite, color: kDrawerIconColor,),
                title: const Text('Favourites', style: TextStyle(fontSize: 18, color: kDrawerTextColor,),),
              ),
              ListTile(
                onTap: () {
                  rateController.hideDrawer();
                  Get.toNamed('/RateAppScreen');
                },
                leading: const Icon(Icons.rate_review_outlined, color: kDrawerIconColor,),
                title: const Text('Rate The App', style: TextStyle(fontSize: 18, color: kDrawerTextColor,),),
              ),
              ListTile(
                onTap: () {
                  Share.share('check out my website https://example.com');
                },
                leading: const Icon(Icons.share, color: kDrawerIconColor,),
                title: const Text('Share App with Friends', style: TextStyle(fontSize: 18, color: kDrawerTextColor,),),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed('/SettingsScreen');
                },
                leading: const Icon(Icons.settings, color: kDrawerIconColor,),
                title: const Text('Settings', style: TextStyle(fontSize: 18, color: kDrawerTextColor,),),
              ),
              const Spacer(),
              ListTile(
                onTap: () async{
                  await FirebaseAuth.instance.signOut();
                  Get.offNamed('/LoginScreen');
                },
                leading: const Icon(Icons.logout_outlined, color: kDrawerIconColor,),
                title: const Text('Logout', style: TextStyle(fontSize: 18, color: kDrawerTextColor,),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
