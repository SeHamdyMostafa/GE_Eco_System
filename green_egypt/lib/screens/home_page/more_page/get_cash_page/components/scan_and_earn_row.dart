import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/application_theme_controller_box.dart';

class ScanAndEarnRow extends StatelessWidget {
  const ScanAndEarnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Now , Scan".tr,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,
         color: ApplicationThemeController.instance.isDark
            ? Colors.white
            : Colors.black),
        ),
        SizedBox(
          width: 12,
        ),
        FaIcon(
          FontAwesomeIcons.qrcode,
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          "And Earn".tr,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,
         color: ApplicationThemeController.instance.isDark
            ? Colors.white
            : Colors.black),
        ),
        SizedBox(
          width: 8,
        ),
        FaIcon(
          FontAwesomeIcons.moneyBill,
        )
      ],
    );
  }
}
