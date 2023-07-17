import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/dimensions.dart';
import '../../../../config/theme/application_theme_controller_box.dart';
import 'Container_model.dart';


class Transaction_model_week extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ApplicationThemeController.instance.isDark
                  ? Colors.black
                  : Colors.white ,  
        
      ),
      
      child: ListView(
        scrollDirection: Axis.horizontal,

        children: [
          SizedBox(width: 10,),
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
          /************************ Model For Week ************************/
          SizedBox(width: 12),
          Container_model(
              content: 'Sat'.tr, Height: Dimensions.height * 0.15),
          SizedBox(width: 20),
          Container_model(
              content: 'Sun'.tr, Height: Dimensions.height * 0.12),
              SizedBox(width: 20),
          Container_model(
              content: 'Mon'.tr, Height: Dimensions.height * 0.13),
              SizedBox(width: 20),
          Container_model(
              content: 'Tue'.tr, Height: Dimensions.height * 0.11),
              SizedBox(width: 20),
          Container_model(
              content: 'Wed'.tr, Height: Dimensions.height * 0.09),
              SizedBox(width: 20),
          Container_model(
              content: 'Thu'.tr, Height: Dimensions.height * 0.14),
              SizedBox(width: 20),
          Container_model(
              content: 'Fri'.tr, Height: Dimensions.height * 0.11),
              SizedBox(width: 20),
        ],
      ),
    );
  }
}
