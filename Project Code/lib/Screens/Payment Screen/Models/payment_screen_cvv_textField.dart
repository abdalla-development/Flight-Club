import 'package:flutter/material.dart';

class PaymentScreenCVVTextField extends StatelessWidget {
  const PaymentScreenCVVTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SizedBox(
        height: 50,
        child: TextField(
          textAlign: TextAlign.center,
          onChanged: (value){},
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(2,1,2,1),
            hintText: 'CVV',
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
      ),);
  }
}
