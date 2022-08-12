import 'package:get/get.dart';

class OnboardScreenController extends GetxController{

  final isLast = false.obs;

  checkLastPage(int index){
    if (index==2){
      isLast.value = true;

    }else{
      isLast.value = false;
    }
  }
}