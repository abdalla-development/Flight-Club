import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../Controller/rate_app_screen_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateAppScreen extends StatelessWidget {
  RateAppScreen({Key? key}) : super(key: key);

  final rateAppScreenController = Get.find<RateAppScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> AdvancedDrawer(
        backdropColor: kDrawerBackgroundColor,
        controller: rateAppScreenController.drawerController,
        openScale: 0.95,
        openRatio: 0.80,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        drawer:  CustomDrawer(),
        child: Stack(
          children: [
            Scaffold(
              extendBody: true,
              resizeToAvoidBottomInset: false,
              extendBodyBehindAppBar: true,
              appBar: customAppBar(
                usingTitle: true,
                leadingIcon: const Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.black54,
                ),
                title: 'Rate The App',
                onPressed: () {
                  rateAppScreenController.toggleDrawer();
                },
              ),
              body: Container(
                decoration: kAppBackgroundColor,
                child: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(top: 25, left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children:  [
                        const CircleAvatar(
                          radius: 80,
                          child: Image(
                            image: AssetImage(
                                'Images/RateAppScreen/rate_app_icon.png'),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('How Did You Like The App?', style: TextStyle(fontSize: 15),),
                            Column(
                              children: [
                                Text(rateAppScreenController.appLikeRate.value.toString(), style: const TextStyle(fontSize: 18),),
                                RatingBar.builder(
                                    itemBuilder: (context, _)=> const Icon(Icons.star, color: Colors.amber,),
                                    onRatingUpdate: (rating){
                                      rateAppScreenController.updateAppLikeRate(rating);
                                    },
                                  updateOnDrag: true,
                                  minRating: 1,
                                  itemSize: 28,
                                  initialRating: 1,
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                                    // minRating = 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Was The App Easy To Use?', style: TextStyle(fontSize: 15),),
                            Column(
                              children: [
                                Text(rateAppScreenController.appEasyToUseRate.value.toString(), style: const TextStyle(fontSize: 18),),
                                RatingBar.builder(
                                  itemBuilder: (context, _)=> const Icon(Icons.star, color: Colors.amber,),
                                  onRatingUpdate: (rating){
                                    rateAppScreenController.updateAppEasyToUseRating(rating);
                                  },
                                  updateOnDrag: true,
                                  minRating: 1,
                                  itemSize: 28,
                                  initialRating: 1,
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                                  // minRating = 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('How Were You Satisfied?', style: TextStyle(fontSize: 15),),
                            Column(
                              children: [
                                Text(rateAppScreenController.appUserSatisfactionRate.value.toString(), style: const TextStyle(fontSize: 18),),
                                RatingBar.builder(
                                  itemBuilder: (context, _)=> const Icon(Icons.star, color: Colors.amber,),
                                  onRatingUpdate: (rating){
                                    rateAppScreenController.updateAppUserSatisfactionRating(rating);
                                  },
                                  updateOnDrag: true,
                                  minRating: 1,
                                  initialRating: 1,
                                  itemSize: 28,
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                                  // minRating = 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
