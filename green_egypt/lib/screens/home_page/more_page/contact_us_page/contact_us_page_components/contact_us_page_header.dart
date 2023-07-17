import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:lottie/lottie.dart';

class ContactUsPageHeader extends StatelessWidget {
  const ContactUsPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.green,
                ),
                height: Dimensions.height*0.05,
                width: Dimensions.width*0.15,
                decoration: BoxDecoration(
                  color: ApplicationThemeController.instance.isDark
                      ? Colors.black
                      : Colors.white,
                  borderRadius:
                      BorderRadius.circular(15), //border corner radius
                  
                ),
              ),
            ],
          ),
          Container(
              child: SizedBox(
            child: Lottie.asset(
                'assets/animated_vectors/contact_us_animation.json'),
          )),
          Container(
            alignment: Alignment.center,
            child: Text('Contact Us'.tr,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: Dimensions.height * .04,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '🍀 Our Team Would like To Hear You ! 🍀'.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
