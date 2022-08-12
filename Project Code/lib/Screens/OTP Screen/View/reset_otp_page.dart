import 'package:flutter/material.dart';
import '../../../Utilities/Configurations/colors.dart';
import '../../../Utilities/Models/otp_input_fields.dart';


class ResetUsingOTPPage extends StatefulWidget {
  const ResetUsingOTPPage({Key? key}) : super(key: key);

  static String id = 'ResetUsingOTPPage';

  @override
  State<ResetUsingOTPPage> createState() => _ResetUsingOTPPageState();
}

class _ResetUsingOTPPageState extends State<ResetUsingOTPPage> {

  TextEditingController controllerField1 = TextEditingController();
  TextEditingController controllerField2 = TextEditingController();
  TextEditingController controllerField3 = TextEditingController();
  TextEditingController controllerField4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: kAppBackgroundColor,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            margin: const EdgeInsets.only(top: 30.0, left: 25, right: 15, bottom: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              // color: kContainerColor,
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 80,
                  child: Image(
                    image:
                    AssetImage('Images/OTPScreen/otp_screen_icon.png'),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Column(
                          children: [
                            // VerifyUserForgetPasswordAvatar(),
                            const SizedBox(
                              height: 25.0,
                            ),
                            const Text(
                              'Please Enter The OTP Code',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            OTPInputFields(controllerField1: controllerField1, controllerField2: controllerField2, controllerField4: controllerField4, controllerField3: controllerField3,),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff22577E),
                            onPrimary: Colors.white,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            minimumSize: const Size(250, 40), //////// HERE
                          ),
                          onPressed: () {
                            // Navigator.pushReplacementNamed(context, LoginPage.id);
                          },
                          child: const Text(
                            'Finished',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
