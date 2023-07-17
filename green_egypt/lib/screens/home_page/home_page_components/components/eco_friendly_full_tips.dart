import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:green_egypt/screens/home_page/home_page_components/widgets/friendly_tips_item.dart';

class EcoFriendlyFullTips extends StatelessWidget {
  EcoFriendlyFullTips({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * Implement List view with 15 tip .
     */
    return Scaffold(
      backgroundColor: ApplicationThemeController.instance.isDark
          ? Colors.black
          : Color(0xfffefefc),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
          Container(
            width: Dimensions.width,
            height: Dimensions.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              color: ApplicationThemeController.instance.isDark
                  ? Colors.black
                  : Color(0xfff7f5f5),
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 8,
                    width: Dimensions.width * .2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[350]!.withOpacity(.9)),
                  ),
                ),
                /**
                * one -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath: 'assets/images/friendly_tips_images/socket.png',
                  tipTitle: 'switch_socket'.tr,
                  tipSubtitle: 'switch_socket-subtitle'.tr,
                ),

                /**
                * two -friendly tip
                */
                FriendlyTipsItem(
                    tipImagePath: 'assets/images/friendly_tips_images/oven.png',
                    tipTitle: 'Use_microwave'.tr,
                    tipSubtitle: 'Use_microwave_subtitle'.tr),

                /**
                * three -friendly tip
                */

                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/plastic.png',
                  tipTitle: 'Reduce_plastic'.tr,
                  tipSubtitle: 'Reduce_plastic_subtitle'.tr,
                ),

                /**
                * four -friendly tip
                */

                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/water-bottle.png',
                  tipTitle: 'reusable_water'.tr,
                  tipSubtitle: 'reusable_water_subtitle'.tr,
                ),

                /**
                * five -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/vehicles.png',
                  tipTitle: 'public_transport'.tr,
                  tipSubtitle: 'public_transport_subtitle'.tr,
                ),

                /**
                * six -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath: 'assets/images/friendly_tips_images/socket.png',
                  tipTitle: 'switch_socket'.tr,
                  tipSubtitle: 'switch_socket-subtitle'.tr,
                ),

                /**
                * two -friendly tip
                */
                FriendlyTipsItem(
                    tipImagePath: 'assets/images/friendly_tips_images/oven.png',
                    tipTitle: 'Use_microwave'.tr,
                    tipSubtitle: 'Use_microwave_subtitle'.tr),

                /**
                * three -friendly tip
                */

                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/plastic.png',
                  tipTitle: 'Reduce_plastic'.tr,
                  tipSubtitle: 'Reduce_plastic_subtitle'.tr,
                ),

                /**
                * four -friendly tip
                */

                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/water-bottle.png',
                  tipTitle: 'reusable_water'.tr,
                  tipSubtitle: 'reusable_water_subtitle'.tr,
                ),

                /**
                * five -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/vehicles.png',
                  tipTitle: 'public_transport'.tr,
                  tipSubtitle: 'public_transport_subtitle'.tr,
                ),
                FriendlyTipsItem(
                  tipImagePath: 'assets/images/friendly_tips_images/socket.png',
                  tipTitle: 'switch_socket'.tr,
                  tipSubtitle: 'switch_socket-subtitle'.tr,
                ),

                /**
                * two -friendly tip
                */
                FriendlyTipsItem(
                    tipImagePath: 'assets/images/friendly_tips_images/oven.png',
                    tipTitle: 'Use_microwave'.tr,
                    tipSubtitle: 'Use_microwave_subtitle'.tr),

                /**
                * three -friendly tip
                */

                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/plastic.png',
                  tipTitle: 'Reduce_plastic'.tr,
                  tipSubtitle: 'Reduce_plastic_subtitle'.tr,
                ),

                /**
                * four -friendly tip
                */

                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/water-bottle.png',
                  tipTitle: 'reusable_water'.tr,
                  tipSubtitle: 'reusable_water_subtitle'.tr,
                ),

                /**
                * five -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/vehicles.png',
                  tipTitle: 'public_transport'.tr,
                  tipSubtitle: 'public_transport_subtitle'.tr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
