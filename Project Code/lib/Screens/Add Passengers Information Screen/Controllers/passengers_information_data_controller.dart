import 'package:get/get.dart';

class PassengersInformationDataController extends GetxController{
  final passengersData = [].obs;
  final firstNameDataAdults = [].obs;
  final firstNameDataChildren = [].obs;
  final firstNameDataInfants = [].obs;
  final lastNameDataAdults = [].obs;
  final lastNameDataChildren = [].obs;
  final lastNameDataInfants = [].obs;
  final idDataAdults = [].obs;
  final idDataChildren = [].obs;
  final idDataInfants = [].obs;

  void addAdultsFirstName({required String name, required int index}){
    if(firstNameDataAdults.isEmpty){
      firstNameDataAdults.insert(index, name);
    }else {
      firstNameDataAdults.removeAt(index);
      firstNameDataAdults.insert(index, name);
    }
  }

  void addAdultsLastName({required String name, required int index}){
    if(lastNameDataAdults.isEmpty){
      lastNameDataAdults.insert(index, name);
    }else{
      lastNameDataAdults.removeAt(index);
      lastNameDataAdults.insert(index, name);
    }
  }

  void addAdultsID({required String name, required int index}){
    if (idDataAdults.isEmpty){
      idDataAdults.insert(index, name);
    }else {
      idDataAdults.removeAt(index);
      idDataAdults.insert(index, name);
    }
  }

  void addChildrenFirstName({required String name, required int index}){
    if (firstNameDataChildren.isEmpty){
      firstNameDataChildren.insert(index, name);
    }else {
      firstNameDataChildren.removeAt(index);
      firstNameDataChildren.insert(index, name);
    }
  }

  void addChildrenLastName({required String name, required int index}){
    if (lastNameDataChildren.isEmpty) {
      lastNameDataChildren.insert(index, name);
    }else {
      lastNameDataChildren.removeAt(index);
      lastNameDataChildren.insert(index, name);
    }
  }

  void addChildrenID({required String name, required int index}){
    if (idDataChildren.isEmpty){
      idDataChildren.insert(index, name);
    }else {
      idDataChildren.removeAt(index);
      idDataChildren.insert(index, name);
    }
  }

  void addInfantsFirstName({required String name, required int index}){
    if (firstNameDataInfants.isEmpty){
      firstNameDataInfants.insert(index, name);
    }else {
      firstNameDataInfants.removeAt(index);
      firstNameDataInfants.insert(index, name);
    }
  }

  void addInfantsLastName({required String name, required int index}){
    if (lastNameDataInfants.isEmpty){
      lastNameDataInfants.insert(index, name);
    }else {
      lastNameDataInfants.removeAt(index);
      lastNameDataInfants.insert(index, name);
    }
  }

  void addInfantsID({required String name, required int index}){
    if (idDataInfants.isEmpty){
      idDataInfants.insert(index, name);
    }else {
      idDataInfants.removeAt(index);
      idDataInfants.insert(index, name);
    }
  }

  void adultsData(){
    passengersData.clear();
    for(int i=0; i<firstNameDataAdults.length; i++){
      Map passenger = {
        'First Name' : firstNameDataAdults[i],
        'Last Name'  : lastNameDataAdults[i],
        'ID' : idDataAdults[i],
      };
      passengersData.add(passenger);
    }
  }

  void childrenData(){
    passengersData.clear();
    for(int i=0; i<firstNameDataChildren.length; i++){
      Map passenger = {
        'First Name' : firstNameDataChildren[i],
        'Last Name'  : lastNameDataChildren[i],
        'ID' : idDataChildren[i],
      };
      passengersData.add(passenger);
    }
  }

  void infantsData(){
    passengersData.clear();
    for(int i=0; i<firstNameDataInfants.length; i++){
      Map passenger = {
        'First Name' : firstNameDataInfants[i],
        'Last Name'  : lastNameDataInfants[i],
        'ID' : idDataInfants[i],
      };
      passengersData.add(passenger);
    }
  }
}