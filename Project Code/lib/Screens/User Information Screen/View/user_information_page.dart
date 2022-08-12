import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Methods/Firebase Request/save_user_information_withEmail.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controller/user_information_screen_controller.dart';
import '../Models/user_information_mobileNumber_textField.dart';
import '../Models/user_information_screen_image.dart';
import '../Models/user_information_select_gender.dart';
import '../Models/user_information_username_textField.dart';
import '../Models/user_information_firstName_textField.dart';
import '../Models/user_information_lastName_textField.dart';

class UserInformationScreen extends StatelessWidget {
  UserInformationScreen({Key? key, required this.loggedInMethod}) : super(key: key);

  final userInfoController = Get.put(UserInformationController());
  String loggedInMethod = '';

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            body: Container(
              decoration: kAppBackgroundColor,
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    // color: kContainerColor,
                  ),
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.only(bottom: 20.0, top: 35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const UserInformationScreenImage(),
                      const SizedBox(
                        height: 20,
                      ),
                      UserInformationFirstNameTextField(),
                      const SizedBox(
                        height: 25.0,
                      ),
                      UserInformationLastNameTextField(),
                      const SizedBox(
                        height: 25.0,
                      ),
                      UserInformationUsernameTextField(),
                      const SizedBox(
                        height: 25.0,
                      ),
                      UserInformationMobileTextField(),
                      const SizedBox(
                        height: 25.0,
                      ),
                      UserInformationSelectGender(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff22577E),
                          onPrimary: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          minimumSize: const Size(250, 40), //////// HERE
                        ),
                        onPressed: () async {
                          userInfoController.toggleLoadingSpinner();
                          if (loggedInMethod=='Email') {
                            userInfoController.checkInputsValid();
                            (userInfoController.inputsValid.value)? saveUserInformationEmail() : null;
                          }else if (loggedInMethod=='Mobile'){

                          }else if (loggedInMethod=='Facebook'){

                          }else if (loggedInMethod=='Google'){

                          }else {

                          }
                        },
                        child: const Text(
                          'Save',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          (userInfoController.showLoadingSpinner.value)
              ? const Spinner()
              : Container(),
        ],
      ),
    );
  }
}