import 'package:flight_booking/Utilities/Models/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Functions/error_snackBar_message.dart';
import '../../../Utilities/Models/custom_drawer.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_passengers_controller.dart';
import '../Controllers/passengers_information_data_controller.dart';
import '../Controllers/passengers_information_screen_controller.dart';

class PassengersInformationScreen extends StatelessWidget {
  PassengersInformationScreen({Key? key}) : super(key: key);

   final passengersInfoController = Get.find<PassengersInformationScreenController>();
   final passengersInfoData = Get.find<PassengersInformationDataController>();
   final bookingPassengers = Get.find<FlightBookingPassengersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> AdvancedDrawer(
        backdropColor: kDrawerBackgroundColor,
        controller: passengersInfoController.drawerController,
        openScale: 0.95,
        openRatio: 0.80,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        drawer:  CustomDrawer(),
        child: Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              extendBody: true,
              extendBodyBehindAppBar: true,
              // backgroundColor: kPageBackgroundColor,
              appBar: customAppBar(
                  title: 'Passengers',
                  leadingIcon: const Icon(
                    FontAwesomeIcons.bars,
                    color: Colors.black54,
                  ),
                  usingTitle: true,
                  onPressed: (){
                    passengersInfoController.toggleDrawer();
                  },
              ),
              body: Container(
                decoration: kAppBackgroundColor,
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // here
                                  const Text('Adult Passengers', style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xccE0D8B0)),),
                                  const SizedBox(height: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: passengersInfoController.passengerCardsListAdults,
                                  ),
                                  (passengersInfoController.numberOfChildren.value > 0)? const Text('Children Passengers', style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xccE0D8B0)),):Container(),
                                  (passengersInfoController.numberOfChildren.value > 0)?Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: passengersInfoController.passengerCardsListChildren,
                                  ):Container(),
                                  (passengersInfoController.numberOfInfants.value > 0)?const Text('Infants Passengers', style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xccE0D8B0)),):Container(),
                                  (passengersInfoController.numberOfInfants.value > 0)?Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: passengersInfoController.passengerCardsListInfants,
                                  ):Container(),
                                  const SizedBox(height: 70),
                                  Center(
                                    child: ElevatedButton(
                                      style: kElevationButtonStyle,
                                      onPressed: (){
                                        passengersInfoData.adultsData();
                                        (bookingPassengers.childrenPassengers.value!=0)?passengersInfoData.childrenData():null;
                                        (bookingPassengers.infantsPassengers.value!=0)?passengersInfoData.infantsData():null;
                                        passengersInfoController.checkInformationIsProvided();

                                        if(passengersInfoController.informationProvided.value){
                                          Get.toNamed('/PaymentScreen');
                                        }else {
                                          showErrorSnackBarMessage(
                                            message: 'Please Make Sure To Fill All The Information Fields & Press Save To Processed To Payment',
                                            title: 'Data Missing',
                                          );
                                        }
                                      },
                                      child: const Text('Go To Payment'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            (passengersInfoController.showLoadingSpinner.value)
                ? const Spinner()
                : Container(),
          ],
        ),
      ),
    );
  }
}
