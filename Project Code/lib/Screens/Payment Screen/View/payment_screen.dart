import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controller/payment_screen_controller.dart';
import '../Models/payment_screen_card_textField.dart';
import '../Models/payment_screen_cvv_textField.dart';
import '../Models/payment_screen_icon.dart';
import '../Models/payment_screen_month_expiration_textField.dart';
import '../Models/payment_screen_year_expiration_textField.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  final paymentController = Get.find<PaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> AdvancedDrawer(
        backdropColor: kDrawerBackgroundColor,
        openScale: 0.95,
        openRatio: 0.80,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        controller: paymentController.drawerController,
        drawer:  CustomDrawer(),
        child: Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              extendBody: true,
              extendBodyBehindAppBar: true,
              appBar: customAppBar(
                  usingTitle: true,
                  onPressed: (){
                    paymentController.toggleDrawer();
                  },
                  leadingIcon: const Icon(
                FontAwesomeIcons.bars,
                color: Colors.black54,
              ),
                  title: 'Payment',
              ),
              body: Container(
                decoration: kAppBackgroundColor,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    // color: kContainerColor,
                  ),
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: SafeArea(
                    child: Column(
                      children: [
                        const PaymentScreenIcon(),
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Card Number', style: TextStyle(fontSize: 20,
                                  color: Color(0xcc3AB4F2)
                              ),),
                              const SizedBox(height: 4,),
                              const Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Text('Enter the 16-digits card number on the card', style: TextStyle(fontSize: 10, color: Colors.black54),),
                              ),
                              const SizedBox(height: 4,),
                              const PaymentScreenCardTextField(),
                              const SizedBox(height: 8,),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text('CVV Number', style: TextStyle(fontSize: 20,
                                          color: Color(0xcc3AB4F2)
                                      )),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Text('Enter the 3 or 4 digit number on the card', style: TextStyle(fontSize: 10, color: Colors.black54)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 15,),
                                  const PaymentScreenCVVTextField(),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text('Expiry Date', style: TextStyle(fontSize: 20,
                                          color: Color(0xcc3AB4F2)
                                      )),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Text('Enter the expiration date of the card', style: TextStyle(fontSize: 10, color: Colors.black54)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5,),
                                  const PaymentScreenMonthExpirationTextField(),
                                  const SizedBox(width: 3,),
                                  const Text('/', style: TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w100)),
                                  const SizedBox(width: 3,),
                                  const PaymentScreenYearExpirationTextField(),
                                ],
                              ),
                              const SizedBox(height: 8,),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff22577E),
                            onPrimary: Colors.white,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            maximumSize: const Size(200, 40),
                          ),
                          onPressed: (){},
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Pay', style: TextStyle(fontSize: 18),),
                              const SizedBox(width: 8,),
                              Text('${paymentController.paymentAmount} USD', style: const TextStyle(color: Color(0xffB25068), fontSize: 22),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // bottomNavigationBar: const CustomBottomNavigationBar(),
            ),
            (paymentController.showLoadingSpinner.value)?const Spinner():Container(),
          ],
        ),
      ),
    );
  }
}
