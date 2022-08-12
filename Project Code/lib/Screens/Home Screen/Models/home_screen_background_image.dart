import 'package:flutter/material.dart';

class HomeScreenBackgroundImage extends StatelessWidget {
  const HomeScreenBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: MediaQuery.of(context).size.height,
      bottom: 0,
      child: Image.asset(
        'Images/HomeScreen/home_screen_background.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

