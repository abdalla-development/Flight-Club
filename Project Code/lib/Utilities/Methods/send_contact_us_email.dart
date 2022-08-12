import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:mailer/smtp_server/hotmail.dart';
import '../../Screens/Contact Us Screen/Controllers/contact_us_screen_controller.dart';
import '../../Screens/Home Screen/Controllers/home_screen_controller.dart';
import 'package:mailer/mailer.dart';

final contactUsController = Get.find<ContactUsScreenController>();
final homeScreen = Get.find<HomeScreenController>();

void sendContactUsEmail() async{
  final Email email = Email(
    subject: contactUsController.messageTitle.value,
    body: '${homeScreen.userUsername.value}'
        '\n${contactUsController.messageBody.value}',
    recipients: ['abdo_hu_90@hotmail.com.com'],
    isHTML: false,
  );

  await FlutterEmailSender.send(email);

  // Sending Mail From Inside The App using mailer

  String emailSend = '';
  String passwordSend = '';
  final smtpServer = hotmail(emailSend, passwordSend);
  // final message = Message()
  // ..from = Address('abdo_hu_90@hotmail.com','Abdalla')
  // ..subject = contactUsController.messageTitle.value
  // ..text = '${homeScreen.userUsername.value}'
  //     '\n${contactUsController.messageBody.value}'
  // ..recipients = ['abdo_hu_90@hotmail.com']
  // ;
  //
  // try{
  //   await send(message, smtpServer);
  // } catch(e){}
}