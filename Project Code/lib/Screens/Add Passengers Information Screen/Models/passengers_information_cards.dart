import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Methods/Functions/error_snackBar_message.dart';
import '../Controllers/passengers_information_data_controller.dart';
import '../Controllers/passengers_information_screen_controller.dart';


class PassengersInformationCard extends StatelessWidget {
   PassengersInformationCard({Key? key, required this.index, required this.list}) : super(key: key);

   final passengersInfoController = Get.find<PassengersInformationScreenController>();
   final passengersInfoData = Get.find<PassengersInformationDataController>();
   int index;
   String list;
   String _firstName = '';
   String _lastName = '';
   String _id = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('First Name',style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                      color: Color(0xe6CCD1E4),
                    ),
                    ),
                    TextField(
                      onChanged: (value){
                        if(list=='Adults'){

                        }if(list=='Children'){

                        }else if(list=='Infants'){

                        }
                        _firstName = value;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.userLarge),
                        hintText: 'First Name',
                        labelStyle: TextStyle(
                          // color: kMainTextColor,
                        ),
                        iconColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 1.0),
                          borderRadius:
                          BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius:
                          BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusColor: Colors.grey,
                      ),
                    ),
                  ],
                ),),
              const SizedBox(width: 15,),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Last Name',style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                      color: Color(0xe6CCD1E4),
                    ),),
                    TextField(
                      onChanged: (value){
                        _lastName = value;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.userLarge),
                        hintText: 'Last Name',
                        labelStyle: TextStyle(
                          // color: kMainTextColor,
                        ),
                        iconColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 1.0),
                          borderRadius:
                          BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius:
                          BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusColor: Colors.grey,
                        // prefixIconColor: Colors.orange,
                        // prefixStyle: ,
                      ),

                    ),
                  ],
                ),),
            ],
          ),
          const Text('Passport',style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
              color: Color(0xe6CCD1E4),
          ),),
          const SizedBox(height: 5,),
          TextField(
            onChanged: (value){
              _id = value;
            },
            decoration:  const InputDecoration(
              prefixIcon: Icon(FontAwesomeIcons.userLarge),
              hintText: 'Passport Number',
              labelStyle: TextStyle(color: Colors.greenAccent),
              iconColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black, width: 1.0),
                borderRadius:
                BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.grey, width: 2.0),
                borderRadius:
                BorderRadius.all(Radius.circular(32.0)),
              ),
              focusColor: Colors.grey,
              // prefixIconColor: Colors.orange,
              // prefixStyle: ,
            ),
          ),
          const SizedBox(height: 8,),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffE7AB79),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: (){
                if(list=='Adults' && _firstName!='' && _lastName!='' && _id!=''){
                  passengersInfoData.addAdultsFirstName(name: _firstName, index: index);
                  passengersInfoData.addAdultsLastName(name: _lastName, index: index);
                  passengersInfoData.addAdultsID(name: _id, index: index);
                }else if(list=='Children' && _firstName!='' && _lastName!='' && _id!=''){
                  passengersInfoData.addChildrenFirstName(name: _firstName, index: index);
                  passengersInfoData.addChildrenLastName(name: _lastName, index: index);
                  passengersInfoData.addChildrenID(name: _id, index: index);
                }else if(list=='Infants' && _firstName!='' && _lastName!='' && _id!=''){
                  passengersInfoData.addInfantsFirstName(name: _firstName, index: index);
                  passengersInfoData.addInfantsLastName(name: _lastName, index: index);
                  passengersInfoData.addInfantsID(name: _id, index: index);
                }else {
                  showErrorSnackBarMessage(
                      message: 'You Need To Fill All The Fields Before Go To Payment',
                      title: 'Empty Fields',
                  );
                }
              },
              child: const Text('Save Information'),),
          )
        ],
      ),
    );
  }
}
