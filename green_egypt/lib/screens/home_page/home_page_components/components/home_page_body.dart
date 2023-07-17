import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';
import 'package:green_egypt/screens/home_page/home_page_components/components/card_of_earned_saved_recycled.dart';
import 'package:green_egypt/screens/home_page/home_page_components/components/eco_friendly_tips_row.dart';
import 'package:green_egypt/screens/home_page/home_page_components/components/list_of_categories_items.dart';
import 'package:green_egypt/screens/home_page/home_page_components/components/list_of_friendly_tips.dart';

final homePageBody = SafeArea(
  child: Padding(
    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
    child: Container(
      width: Dimensions.width,
      height: Dimensions.height,
      child: Column(
        children: [
          CardOfEarnedSavedRecycled(),
          Row(
            children: [
              Text(
                'Waste Categories'.tr,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: DefaultFonts.defaultLondrinaSolidThin),
              )
            ],
          ),
          /**
                       * Horizontal list of categories as plastic , glass and paper
                       */
          ListOfCategoriesItems(),
          /**
                       * Eco friendly tips row with view all option
                       */
          EcoFriendlyTipsRow(),
          /**
                       * Vertical list of friendly tips
                       */
          ListOfFriendlyTips()
        ],
      ),
    ),
  ),
);
