import 'package:flutter/material.dart';

AppBar customAppBar({
  required String title,
  required Icon leadingIcon,
  required bool usingTitle,
  required Function onPressed,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: leadingIcon,
      onPressed: () {
        onPressed();
        },
    ),
    title: (usingTitle)
        ? Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              color: Color(0xbfD0C9C0),
            ),
          )
        : null,
  );
}
