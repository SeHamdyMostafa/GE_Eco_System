import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/services/custom_toast.dart';

class HomePageActions extends StatelessWidget {
  const HomePageActions({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationThemeController>(builder: (themeController) {
      return Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: GestureDetector(
          onTap: () {
            CustomToast.showGreenToast(
                messsage: 'Will be available soom , AMG');
          },
          child: Center(
            child: badges.Badge(
              child: Icon(
                Icons.notifications,
                color: themeController.isDark
                    ? DefaultColors.defaultWhite
                    : DefaultColors.defaultBlack,
                size: 28,
              ),
              position: badges.BadgePosition.custom(top: 0),
              badgeStyle:
                  badges.BadgeStyle(badgeColor: DefaultColors.defaultGreen),
            ),
          ),
        ),
      );
    });
  }
}
