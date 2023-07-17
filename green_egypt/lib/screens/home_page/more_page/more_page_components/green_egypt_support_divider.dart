import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';

class GreenEgyptSupportDivider extends StatelessWidget {
  late ApplicationThemeController applicationThemeController;
  GreenEgyptSupportDivider({required this.applicationThemeController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width,
      color: applicationThemeController.isDark
          ? Colors.grey[850]
          : Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
        child: Row(
          children: [
            Text(
              'GREEN EGYPT SUPPORT'.tr,
              style: TextStyle(
                  color: applicationThemeController.isDark
                      ? Colors.grey[100]
                      : Colors.grey[700]),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(Icons.support_agent_outlined)
          ],
        ),
      ),
    );
  }
}
