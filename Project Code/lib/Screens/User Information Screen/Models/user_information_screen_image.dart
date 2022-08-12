import 'package:flutter/material.dart';

class UserInformationScreenImage extends StatelessWidget {
  const UserInformationScreenImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 80,
      child: Image(
        image: AssetImage(
            'Images/UserInformationScreen/user_information_icon.png'),
      ),
    );
  }
}
