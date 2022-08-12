import 'package:flutter/material.dart';

class SettingsScreenIcon extends StatelessWidget {
  const SettingsScreenIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 80,
      child: Image(
        image: AssetImage(
            'Images/SettingsScreen/settings_screen_icon.png'),
      ),
    );
  }
}
