import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/home_page/home_page_components/widgets/friendly_tips_item.dart';
import 'package:green_egypt/screens/home_page/home_page_components/controller/home_page_animations_controller.dart';

class ListOfFriendlyTips extends StatelessWidget {
  ListOfFriendlyTips({super.key});

  Widget animatedContainer(double h) {
    return AnimatedContainer(duration: Duration(milliseconds: 750), height: h);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GetBuilder<HomePageAnimationsController>(
          init: HomePageAnimationsController(),
          builder: (controller) {
            List<Widget> miniEcoFriendlyTipsList = [
              animatedContainer(controller.animatedContainerHeight),
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
                tipImagePath: 'assets/images/friendly_tips_images/plastic.png',
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
                tipImagePath: 'assets/images/friendly_tips_images/vehicles.png',
                tipTitle: 'public_transport'.tr,
                tipSubtitle: 'public_transport_subtitle'.tr,
              )
            ];
            return AnimatedOpacity(
              duration: Duration(milliseconds: 750),
              opacity: controller.itemOpacity,
              child: ListView(children: miniEcoFriendlyTipsList),
            );
          }),
    );
  }
}
