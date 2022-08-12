import 'package:get/get.dart';
import '../../Add Passengers Information Screen/Controllers/passengers_information_data_controller.dart';
import '../../Add Passengers Information Screen/Controllers/passengers_information_screen_controller.dart';
import '../../Available Flights Screen/Controllers/available_flights_request_controller.dart';
import '../../Available Flights Screen/Controllers/available_flights_response_controller.dart';
import '../../Available Flights Screen/Controllers/available_flights_screen_controller.dart';
import '../../Change Password Screen/Controller/change_password_controller.dart';
import '../../Contact Us Screen/Controllers/contact_us_screen_controller.dart';
import '../../FLight Booking Screen/Controller/flight_booking_controller.dart';
import '../../FLight Booking Screen/Controller/flight_booking_request_data.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_cabin_controller.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_city_controller.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_date_controller.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_passengers_controller.dart';
import '../../FLight Booking Screen/Controller/flight_booking_select_tripType_controller.dart';
import '../../Favourites Screen/Controller/favourites_screen_controller.dart';
import '../../Flight Deals Screen/Controller/flight_deals_controller.dart';
import '../../Flight Deals Screen/Controller/flight_deals_request_data.dart';
import '../../Flight Deals Screen/Controller/flight_deals_select_cabin_controller.dart';
import '../../Flight Deals Screen/Controller/flight_deals_select_city_controller.dart';
import '../../Flight Deals Screen/Controller/flight_deals_select_date_controller.dart';
import '../../Flight Deals Screen/Controller/flight_deals_select_passengers_controller.dart';
import '../../Flight Deals Screen/Controller/flight_deals_select_tripType_controller.dart';
import '../../Flight Details Screen/Controllers/flight_details_screen_controller.dart';
import '../../Flight Tracking Screen/Controllers/flight_tracking_screen_controller.dart';
import '../../Flight Tracking Screen/Controllers/tracked_flight_screen_controller.dart';
import '../../Forget Password Screen/Controller/forget_password_controller.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';
import '../../Payment Screen/Controller/payment_screen_controller.dart';
import '../../Privacy & Policy Screen/Controllers/privacy_and_policy_screen_contoller.dart';
import '../../Rate App Screen/Controller/rate_app_screen_controller.dart';
import '../../Settings Screen/Controller/settings_screen_controller.dart';
import '../../Terms & Conditions Screen/Controllers/terms_and_conditions_screen_controller.dart';
import '../Controller/login_screen_controller.dart';

class LoginScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginScreenController());
    Get.put(HomeScreenController());
    Get.put(AvailableFlightsScreenController());
    Get.put(FlightBookingController());
    Get.put(FlightDealsScreenController());
    Get.put(FlightTrackingScreenController());
    Get.put(FlightBookingRequestData());
    Get.put(FlightBookingCabinController());
    Get.put(FlightBookingCityController());
    Get.put(FlightBookingDateController());
    Get.put(FlightBookingPassengersController());
    Get.put(FlightBookingTripTypeController());
    Get.put(FlightDetailsScreenController());
    Get.put(PassengersInformationScreenController());
    Get.put(PassengersInformationDataController());
    Get.put(AvailableFlightsScreenController());
    Get.put(AvailableFlightRequestController());
    Get.put(AvailableFlightResponseController());
    Get.put(ChangeMyPasswordController());
    Get.put(FlightDetailsScreenController());
    Get.put(TrackedFlightScreenController());
    Get.put(PaymentScreenController());
    Get.put(FlightDealsRequestData());
    Get.put(FlightDealsSelectCabinController());
    Get.put(FlightDealsSelectCityController());
    Get.put(FlightDealsSelectDateController());
    Get.put(FlightDealsSelectPassengersController());
    Get.put(FlightDealsSelectTripTypeController());
    Get.put(FavouritesScreenController());
    Get.put(PrivacyAndPolicyScreenController());
    Get.put(TermsConditionsScreenController());
    Get.put(ContactUsScreenController());
    Get.put(RateAppScreenController());
    Get.put(SettingsScreenController());
    Get.put(ForgetPasswordController());
  }
}