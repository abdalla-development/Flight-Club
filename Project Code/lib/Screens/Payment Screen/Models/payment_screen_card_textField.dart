import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentScreenCardTextField extends StatelessWidget {
  const PaymentScreenCardTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){},
      decoration: const InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.creditCard),
        hintText: '1234-5678-9123-4567',
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
    );
  }
}
