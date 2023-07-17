import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/home_page/home_page_components/controller/home_page_animations_controller.dart';

class UserDetailColumn extends StatelessWidget {
  // final animationController = Get.put(HomePageAnimationsController());
  Widget icon;
  String detailValue;
  String detailTitle;
  int animationMilliSeconds;
  String valueMark;
  UserDetailColumn(
      {required this.icon,
      required this.detailValue,
      required this.valueMark,
      required this.detailTitle,
      required this.animationMilliSeconds});

  @override
  Widget build(BuildContext context) {
    // animationController.decreaseAnimaredContainerSize();
    return GetBuilder<HomePageAnimationsController>(
        init: HomePageAnimationsController(),
        builder: (controller) {
          controller.decreaseAnimaredContainerSize();
          controller.removeHidden();
          return Expanded(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 750),
              opacity: controller.itemOpacity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                      curve: Curves.easeInOutCubic,
                      duration: Duration(milliseconds: 750),
                      height: controller.animatedContainerHeight),
                  icon,
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        detailValue,
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.yellow[50]!.withOpacity(.9),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        " " + valueMark,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.yellow[50]!.withOpacity(.9),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    detailTitle,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          );
        });
  }
}
