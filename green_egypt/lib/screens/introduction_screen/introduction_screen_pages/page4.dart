import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Page4 extends StatelessWidget {
  String heroTag = "tag";
  Color pageColor = Color(0xFF00BBBC);
  late AssetImage image;
  late PageController controller;
  Page4({required this.image, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width,
      height: Dimensions.height,
      child: Stack(
        children: [
          Image(
              image: image,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
              width: Dimensions.width),
          Column(
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Dimensions.width * .3,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(16)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(pageColor)),
                    onPressed: () async {
                      await FirstLaunch.changeFirstLaunchValue().then(
                          (value) => Get.offNamed(PagesNames.startScreen));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Icon(Icons.rocket_launch_outlined)],
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width * .05,
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: SlideEffect(
                        spacing: 18.0,
                        radius: 4.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: pageColor),
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.width * .08,
              ),
            ],
          )
        ],
      ),
    );
  }
}

