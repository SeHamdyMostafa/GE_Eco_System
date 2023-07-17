import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/home_page/home_page_components/controller/home_page_animations_controller.dart';
import 'package:green_egypt/screens/home_page/home_page_components/components/user_detail_column.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';

class CardOfEarnedSavedRecycled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: Dimensions.height * .04),
          width: Dimensions.width,
          // height: Dimensions.height * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/main_page_images/card_background.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(24),
            color: DefaultColors.defaultGreen,
          ),
          child: Row(
            children: [
              /**
                             * Earned Currency Column
                             */
              UserDetailColumn(
                  icon: FaIcon(
                    FontAwesomeIcons.bottleWater,
                    color: Colors.green[400],
                  ),
                  detailValue: '${UserDataBox.instance.get_recycledPlasticItemsNumber()}',
                  valueMark: '',
                  detailTitle: 'Plastic'.tr,
                  animationMilliSeconds: 500),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: Dimensions.height * .1,
                    color: Colors.white.withOpacity(.9),
                  )
                ],
              ),
              UserDetailColumn(
                  icon: FaIcon(
                    FontAwesomeIcons.bottleDroplet,
                    color: Colors.grey[350],
                    size: 28,
                  ),
                  detailValue: '${UserDataBox.instance.get_recycledCansItemsNumber()}',
                  valueMark: '',
                  detailTitle: 'Cans'.tr,
                  animationMilliSeconds: 500),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: Dimensions.height * .1,
                    color: Colors.white.withOpacity(.9),
                  )
                ],
              ),
              UserDetailColumn(
                  icon: FaIcon(
                    FontAwesomeIcons.coins,
                    color: Colors.yellow[400],
                    size: 28,
                  ),
                  detailValue: '${UserDataBox.instance.get_totalPoints()}',
                  valueMark: "",
                  detailTitle: 'Points'.tr,
                  animationMilliSeconds: 500),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: Dimensions.height * .1,
                    color: Colors.green[900]!.withOpacity(.2),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
