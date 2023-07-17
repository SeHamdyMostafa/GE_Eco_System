import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/default_colors.dart';

import '../../../config/theme/application_theme_controller_box.dart';

class StartScreenRegisterButton extends StatelessWidget {
  const StartScreenRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: DefaultColors.defaultGreen, width: 2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: DefaultColors.defaultGreen),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      onPressed: () {
        /**
                     * Navigate to Register Page
                     */
        Get.toNamed(PagesNames.registerPage);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Register".tr,
            style: TextStyle(color:ApplicationThemeController.instance.isDark
                                        ? Colors.white
                                        : Colors.black),
          ),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.person_add_alt_outlined,
            color: DefaultColors.defaultGreen,
          )
        ],
      ),
    );
  }
}
