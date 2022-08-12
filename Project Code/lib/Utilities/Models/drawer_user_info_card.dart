import 'package:flutter/material.dart';

import '../Methods/Functions/upload_user_avatar.dart';


class UserCardConstructor extends StatelessWidget {
  const UserCardConstructor({
    Key? key,
    required this.username,
    required this.userEmail,
    required this.userPhotoUrl,
  }) : super(key: key);

  final String username;
  final String userEmail;
  final String userPhotoUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0x4d94B49F),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(2, 4), // Shadow position
              ),
            ],
          ),
          margin: const EdgeInsets.only(top: 20, left: 70,),
          height: 155,
          // width: 400,
        ),
        Container(
          margin: const EdgeInsets.only(top: 28, left: 15),
          child: ClipOval(
            child: CircleAvatar(
              radius: 70,
              child: Image.network(
                  userPhotoUrl,
                  fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 55, left: 159),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                username,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(userEmail,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 145, left: 75),
          child: IconButton(
            onPressed: (){
              uploadUserAvatar();
            },
            icon: const Icon(Icons.edit, color: Color(0xff464E2E),),
          ),
        ),
      ],
    );
  }
}
