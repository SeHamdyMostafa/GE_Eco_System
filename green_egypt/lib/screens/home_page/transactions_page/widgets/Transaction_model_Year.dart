import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/dimensions.dart';
import '../../../../config/theme/application_theme_controller_box.dart';
import 'Container_model.dart';

class Transaction_model_Year extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ApplicationThemeController.instance.isDark
            ? Colors.black
            : Colors.white,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 10,
          ),
          /************************ Column Of Percentile Degrees ************************/
          Column(
            children: [
              SizedBox(
                height: Dimensions.height * 0.032
              ),
              Text(
                "100%".tr,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: Dimensions.height * 0.025
              ),
              Text(
                "75%".tr,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: Dimensions.height * 0.025
              ),
              Text(
                "50%".tr,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: Dimensions.height * 0.025
              ),
              Text(
                "25%".tr,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: Dimensions.height * 0.025
              ),
              Text(
                "0%".tr,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          /************************ Model For Year ************************/
          SizedBox(width: 12),
          Container_model(
            content: 'Jan'.tr,
            Height: Dimensions.height * 0.15,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Feb'.tr,
            Height: Dimensions.height * 0.10,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Mar'.tr,
            Height: Dimensions.height * 0.09,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Apr'.tr,
            Height: Dimensions.height * 0.14,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'May'.tr,
            Height: Dimensions.height * 0.11,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Jun'.tr,
            Height: Dimensions.height * 0.09,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Jul'.tr,
            Height: Dimensions.height * 0.16,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Aug'.tr,
            Height: Dimensions.height * 0.10,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Sep'.tr,
            Height: Dimensions.height * 0.13,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Oct'.tr,
            Height: Dimensions.height * 0.09,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Nov'.tr,
            Height: Dimensions.height * 0.12,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Dec'.tr,
            Height: Dimensions.height * 0.14,
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
