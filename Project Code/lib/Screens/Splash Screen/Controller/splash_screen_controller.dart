import 'package:get/get.dart';
import '../../Login Screen/Controller/login_screen_controller.dart';

class SplashScreenController extends GetxController{

  final status = true.obs;

  toggleFirstTimeLunch(){
    status.value = !status.value;
  }
}