import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/dimensions.dart';
import '../../../../config/theme/application_theme_controller_box.dart';
import 'Container_model.dart';



class Transaction_model_month extends StatelessWidget {
  const Transaction_model_month({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ApplicationThemeController.instance.isDark
                  ? Colors.black
                  : Colors.white  
      
      ),

      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
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

          /************************ Model For Month ************************/
          Container_model(
              content: 'Week 1'.tr,Height: Dimensions.height * 0.125),
          Container_model(
              content: 'Week 2'.tr, Height: Dimensions.height * 0.09),
          Container_model(
              content: 'Week 3'.tr, Height: Dimensions.height * 0.14),
          Container_model(
              content: 'Week 4'.tr, Height: Dimensions.height * 0.11),
        ],
      ),
    );
  }
}
