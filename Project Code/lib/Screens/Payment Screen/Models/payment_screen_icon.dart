import 'package:flutter/material.dart';

class PaymentScreenIcon extends StatelessWidget {
  const PaymentScreenIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 80,
      child: Image(
        image:
        AssetImage('Images/PaymentScreen/payment_screen_icon.png'),
      ),
    );
  }
}
