import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/more_page/get_cash_page/components/cash_qrcode.dart';
import 'package:green_egypt/screens/home_page/more_page/get_cash_page/components/grey_container.dart';
import 'package:green_egypt/screens/home_page/more_page/get_cash_page/components/scan_and_earn_row.dart';
import 'package:green_egypt/screens/home_page/more_page/get_cash_page/controller/get_cash_page_controller.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../../config/theme/application_theme_controller_box.dart';

class GetCashPage extends StatelessWidget {
  const GetCashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<GetCashPageController>(
            init: GetCashPageController(),
            builder: (controller) {
              return Container(
                color: ApplicationThemeController.instance.isDark
                    ? Colors.black
                    : Colors.white,
                child: Center(
                  child: Container(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 750),
                      opacity: controller.opacity,
                      curve: Curves.easeInOutCubic,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GreyContainer(),
                          Text(
                            "Thanks for Supporting Recycling \n\n ${UserDataBox.instance.get_userName()}".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:ApplicationThemeController.instance.isDark
                                        ? Colors.white
                                        : Colors.black),
                          ),
                          ScanAndEarnRow(),
                          CashQrcode(),
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("I'm Done".tr),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: ApplicationThemeController.instance.isDark
                            ? Color.fromARGB(255, 25, 25, 25)
                            : Color.fromARGB(255, 235, 235, 235),
                        borderRadius: BorderRadius.circular(16)),
                    width: Dimensions.width * .8,
                    height: Dimensions.height * .6,
                  ),
                ),
                width: Dimensions.width,
                height: Dimensions.height,
              );
            }),
      ),
    );
  }
}


/**
 * *************** Draw Ticket shape with code
 */

// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double w = Dimensions.width;
//     double h = Dimensions.height;
//     final path = Path()
//       ..lineTo(w * .05, 0)
//       ..quadraticBezierTo(w * .1, h * .05, w * .2, 0)
//       ..close();

//     throw UnimplementedError();
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
