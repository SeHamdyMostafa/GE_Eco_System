import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/home_page/more_page/get_cash_page/get_cash_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetCash extends StatelessWidget {
  const GetCash({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => GetCashPage(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 750),
            curve: Curves.easeInOutCubic);
      },
      horizontalTitleGap: 0,
      leading: Icon(
        Icons.attach_money,
        color: Colors.yellow[400],
      ),
      title: Text('Get Cash'.tr),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18.sp,
        color: Colors.grey,
      ),
    );
  }
}
