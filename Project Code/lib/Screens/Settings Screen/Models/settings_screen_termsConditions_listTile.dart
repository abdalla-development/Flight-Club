import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SettingsScreenTermsConditionsListTile extends StatelessWidget {
  const SettingsScreenTermsConditionsListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: const Icon(FontAwesomeIcons.fileContract),
        trailing: const Icon(FontAwesomeIcons.angleRight),
        title: const Text('Terms & Conditions'),
        onTap: () {
          Get.toNamed('/TermsAndConditionsScreen');
        },
      ),
    );
  }
}
