import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../config/theme/application_theme_controller_box.dart';

class TransactionsPageTitleRow extends StatelessWidget {
  const TransactionsPageTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: Dimensions.width * .05,
          ),
          Text(
            'Transactions'.tr,
            style: TextStyle(
                color: ApplicationThemeController.instance.isDark
                    ? Color(0xfff7f5f5)
                    : Colors.black,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.history,
            color: ApplicationThemeController.instance.isDark
                ? Color(0xfff7f5f5)
                : Colors.black,
            size: 20.sp,
          )
        ],
      ),
    );
  }
}
