import 'package:flutter/material.dart';

Divider divider = const Divider(
  color: Color(0xFF818589),
  thickness: 2.5,
  indent: 26.0,
  endIndent: 26.0,
);

const kTextFieldDecoration = InputDecoration(
  // prefixIcon: Icon(FontAwesomeIcons.userLarge),
  // hintText: 'First Name',
  labelStyle: TextStyle(color: Colors.grey),
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
);

const showSelectedTripBorder = BoxDecoration(
  border: Border(
    bottom: BorderSide(width: 1.5, color: Colors.grey),
  ),
);

const kSelectDateTheme =  ColorScheme.light(
  primary: Color(0xd91d1e20), // <-- SEE HERE
  onPrimary: Color(0xffF02E65), // <-- SEE HERE
  onSurface: Color.fromARGB(
      255, 66, 125, 145), // <-- SEE HERE
);

 ButtonStyle kElevationButtonStyle = ElevatedButton.styleFrom(
  primary: const Color(0xff22577E),
  onPrimary: Colors.white,
  elevation: 3,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32.0),
  ),
  minimumSize: const Size(250, 40), //////// HERE
);