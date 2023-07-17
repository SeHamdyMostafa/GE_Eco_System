import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl = UserDataBox.instance.get_userImageUrl();
    String userName = UserDataBox.instance.get_userName();

    return GetBuilder<ApplicationThemeController>(builder: (themeController) {
      return Row(
        children: [
          /**
           * Container that show image of user .
           */
          Container(
            height: 36,
            width: 48,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(imageUrl)),
                borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(
            width: 8,
          ),
          /**
           * hello message with the name of the user text .
           */
          Text(
            'Hello'.tr + ", " + userName,
            style: TextStyle(
                color: themeController.isDark ? Colors.white : Colors.black,
                fontSize: 16,
                fontFamily: DefaultFonts.defaultLondrinaSolidThin),
          ),
        ],
      );
    });
  }
}
