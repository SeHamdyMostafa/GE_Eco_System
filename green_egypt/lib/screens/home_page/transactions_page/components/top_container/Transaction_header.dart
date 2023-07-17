import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../config/dimensions.dart';
import '../../../../../config/theme/application_theme_controller_box.dart';
import '../../../../../services/boxes/user_data_db.dart';

import '../../widgets/Transaction_model_Month.dart';
import '../../widgets/Transaction_model_Year.dart';
import '../../widgets/Transaction_model_week.dart';
import '../transaction_page_title_row.dart';

class Transaction_header extends StatefulWidget {
  @override
  State<Transaction_header> createState() => _Transaction_headerState();
}

class _Transaction_headerState extends State<Transaction_header> {
  late final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /**
              title row contain transactions word with history logo .
            **/

        TransactionsPageTitleRow(),
        SizedBox(
          height: 12,
        ),
        /**
              Three Button.
            **/

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                minimumSize: MaterialStateProperty.all(
                    Size(Dimensions.width * 0.25, Dimensions.height * 0.05)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text('Weak'.tr,
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              onPressed: () {
                setState(() {
                  pageController.jumpToPage(0);
                });
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                minimumSize: MaterialStateProperty.all(
                    Size(Dimensions.width * 0.25, Dimensions.height * 0.05)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text('Month'.tr,
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              onPressed: () {
                setState(() {
                  pageController.jumpToPage(1);
                });
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                minimumSize: MaterialStateProperty.all(
                    Size(Dimensions.width * 0.25, Dimensions.height * 0.05)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text('Year'.tr,
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              onPressed: () {
                setState(() {
                  pageController.jumpToPage(2);
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height * .03,
        ),

        /**
          total Points.
        **/

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total : ${UserDataBox.instance.get_totalPoints()} point'.tr,
              style: TextStyle(
                  color: ApplicationThemeController.instance.isDark
                      ? Color(0xfff7f5f5)
                      : Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: Dimensions.height * .03,
        ),

        /**
          PageView For Three Model.
        **/
        Container(
          height: Dimensions.height * 0.32,
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: [
              Center(
                child: Transaction_model_week(),
              ),
              Center(
                child: Transaction_model_month(),
              ),
              Center(
                child: Transaction_model_Year(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        /**
         PageIndicator.
        **/
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Color(0xFF79c3f0),
              dotColor: Color(0xFF2d5da9),
              dotHeight: 15,
              dotWidth: 15,
              spacing: 12,
            ),
          ),
        ),
      ],
    );
  }
}
