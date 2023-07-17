import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';
import 'package:green_egypt/screens/home_page/home_page_components/components/eco_friendly_full_tips.dart';
import 'package:green_egypt/screens/home_page/home_page_components/controller/home_page_animations_controller.dart';

class EcoFriendlyTipsRow extends StatelessWidget {
  const EcoFriendlyTipsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageAnimationsController>(
        init: HomePageAnimationsController(),
        builder: (controller) {
          return AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: controller.itemOpacity,
            child: Container(
              width: Dimensions.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Eco-friendly tips'.tr,
                          style: TextStyle(
                              fontFamily: DefaultFonts.defaultLondrinaSolidThin,
                              fontSize: 22),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(EcoFriendlyFullTips(),
                                transition: Transition.downToUp,
                                curve: Curves.easeInCubic,
                                duration: Duration(seconds: 1));
                          },
                          child: Text(
                            'View All'.tr,
                            style: TextStyle(
                                color: DefaultColors.defaultGreen,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
