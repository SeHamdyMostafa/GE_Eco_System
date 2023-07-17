import 'package:flutter/material.dart';
import 'package:green_egypt/screens/home_page/more_page/contact_us_page/contact.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class HelpOption extends StatelessWidget {
  const HelpOption({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      onTap: () {
        Get.to(
          () => ContactPage(),
          transition: Transition.rightToLeft,
          curve: Curves.easeInOutCubic,
          duration: Duration(milliseconds: 500),
        );
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        color: Colors.blue[300],
      ),
      title: Text('Contact us'.tr),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18.sp,
        color: Colors.grey,
      ),
    );
  }
}
