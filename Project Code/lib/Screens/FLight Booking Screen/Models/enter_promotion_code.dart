import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PromotionCode extends StatelessWidget {
   PromotionCode({Key? key}) : super(key: key);

  final controllerPromotion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerPromotion,
      decoration: const InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: 'Promotion Code',
        hintStyle: TextStyle(
          // color: kPromotionColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Icon(
          FontAwesomeIcons.fileCode,
          // color: kPromotionColor,
        ),
      ),
      onChanged: (value) {
        controllerPromotion.text = value;
        // context.read<FlightBookingProviders>().updatePromotionCode(value);
      },
    );
  }
}

