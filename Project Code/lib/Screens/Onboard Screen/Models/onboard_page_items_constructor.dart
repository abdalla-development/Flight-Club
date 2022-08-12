import 'package:flutter/material.dart';

Widget onboardPageItemConstructor({
  required String urlImage,
  required String title,
  required String subtitle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        urlImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 350,
      ),
      const SizedBox(
        height: 64,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(
        height: 44,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ],
  );
}
