import 'package:flutter/material.dart';

class PaymentScreenMonthExpirationTextField extends StatelessWidget {
  const PaymentScreenMonthExpirationTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SizedBox(
        height: 40,
        child: TextField(
          textAlign: TextAlign.center,
          onChanged: (value){},
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(2,2,2,2),
            hintText: 'MM',
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
      ),
    );
  }
}
