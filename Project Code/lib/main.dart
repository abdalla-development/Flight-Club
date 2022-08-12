import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/Add Passengers Information Screen/Views/passengers_information_screen.dart';
import 'Screens/Available Flights Screen/Views/available_flights_screen.dart';
import 'Screens/Change Password Screen/View/change_my_password_page.dart';
import 'Screens/Contact Us Screen/Views/contact_us_screen.dart';
import 'Screens/FLight Booking Screen/View/flight_booking_screen.dart';
import 'Screens/Favourites Screen/View/favourites_screen.dart';
import 'Screens/Flight Deals Screen/View/flight_deals_screen.dart';
import 'Screens/Flight Details Screen/Views/flight_details_screen.dart';
import 'Screens/Flight Tracking Screen/Views/flight_tracking_screen.dart';
import 'Screens/Flight Tracking Screen/Views/tracked_flight_page.dart';
import 'Screens/Forget Password Screen/View/forget_password_screen.dart';
import 'Screens/Home Screen/Bindings/home_screen_binding.dart';
import 'Screens/Home Screen/View/home_screen.dart';
import 'Screens/Login Screen/Bindings/login_screen_binding.dart';
import 'Screens/Login Screen/View/login_screen.dart';
import 'Screens/OTP Screen/View/reset_otp_page.dart';
import 'Screens/Onboard Screen/View/onboard_screen.dart';
import 'Screens/Payment Screen/View/payment_screen.dart';
import 'Screens/Privacy & Policy Screen/Views/privacy_and_policy_screen.dart';
import 'Screens/Rate App Screen/View/rate_app_screen.dart';
import 'Screens/Register Screen/View/register_screen.dart';
import 'Screens/Settings Screen/Bindings/settings_screen_bindings.dart';
import 'Screens/Settings Screen/View/settings_screen.dart';
import 'Screens/Splash Screen/View/splash_screen.dart';
import 'Screens/Terms & Conditions Screen/Views/terms_and_conditions_screen.dart';
import 'Screens/User Information Screen/View/user_information_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{

  await dotenv.load(fileName: ".env");

  LoginScreenBinding().dependencies();

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  AwesomeNotifications().initialize(
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true
  );
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
  runApp(const FlightBookingApp());
}

class FlightBookingApp extends StatelessWidget {
  const FlightBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // AwesomeNotifications().actionStream.listen(
    //         (ReceivedNotification receivedNotification){
    //       Navigator.of(context).pushNamed(
    //           '/NotificationPage',
    //           arguments: {}
    //       );
    //     }
    // );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // smartManagement: SmartManagement.keepFactory,
      initialRoute: '/SplashScreen',
      getPages: [
        GetPage(name: '/SplashScreen', page: ()=>  SplashScreen()),
        GetPage(name: '/OnboardScreen', page: ()=>  OnboardScreen()),
        GetPage(name: '/LoginScreen', page: ()=>  LoginScreen(), binding: LoginScreenBinding()),
        GetPage(name: '/RegisterScreen', page: ()=>  RegisterScreen()),
        GetPage(name: '/ForgetPasswordScreen', page: ()=>  ForgetPasswordScreen()),
        GetPage(name: '/ChangeMyPasswordScreen', page: ()=>  ChangeMyPasswordScreen()),
        GetPage(name: '/UserInformationScreen', page: ()=>  UserInformationScreen(loggedInMethod: 'Email',)),
        GetPage(name: '/ResetUsingOTPPage', page: ()=>  const ResetUsingOTPPage()),
        GetPage(name: '/HomeScreen', page: ()=>  HomeScreen(), binding: HomeScreenBinding()),
        GetPage(name: '/FavouritesScreen', page: ()=>  FavouritesScreen()),
        GetPage(name: '/RateAppScreen', page: ()=>  RateAppScreen()),
        GetPage(name: '/SettingsScreen', page: ()=>  SettingsScreen(), binding: SettingsScreenBinding()),
        GetPage(name: '/FlightBookingScreen', page: ()=>  FlightBookingScreen()),
        GetPage(name: '/AvailableFlightsScreen', page: ()=>  AvailableFlightsScreen()),
        GetPage(name: '/FlightDetailsScreen', page: ()=>  FlightDetailsScreen()),
        GetPage(name: '/FlightTrackingScreen', page: ()=>  FlightTrackingScreen()),
        GetPage(name: '/TrackedFlightScreen', page: ()=>  TrackedFlightScreen()),
        GetPage(name: '/PassengersInformationScreen', page: ()=>  PassengersInformationScreen()),
        GetPage(name: '/PaymentScreen', page: ()=>  PaymentScreen()),
        GetPage(name: '/FlightDealsScreen', page: ()=>  FlightDealsScreen()),
        GetPage(name: '/TermsAndConditionsScreen', page: ()=>  TermsAndConditionsScreen()),
        GetPage(name: '/PrivacyAndPolicyScreen', page: ()=>  PrivacyAndPolicyScreen()),
        GetPage(name: '/ContactUsScreen', page: ()=>  ContactUsScreen()),
      ],
    );
  }
}

// Used=>  'Karla'  'Righteous' 'Lobster' 'Poppins' 'Lato' 'Nunito Sans' 'Pacifico' 'Satisfy'// Unused=>  'Dela Gothic One'  'Archivo Narrow'

// if(list=='Adults'){
//
// }if(list=='Children'){
//
// }else if(list=='Infants'){
//
// }