import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/more_page/edti_user_info_page/edit_user_info_page.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MorePageHeader extends StatelessWidget {
  const MorePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Dimensions.height * .32,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CircleAvatar(
          backgroundImage:
              NetworkImage(UserDataBox.instance.get_userImageUrl()),
          radius: 65,
        ),
        SizedBox(
          height: Dimensions.height * .02,
        ),
        Text(
          "${UserDataBox.instance.get_userName()}",
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(
          height: Dimensions.height * .02,
        ),
        Text(
          'user account'.tr + " :  " + UserDataBox.instance.get_email(),
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        const SizedBox(
          height: 16,
        ),
        FittedBox(
          child: ElevatedButton(
              onPressed: () {
                Get.to(() => EditUserInfoPage(),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOutCubic,
                    transition: Transition.downToUp);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Edit Profile'.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: Colors.white,
                  )
                ],
              )),
        )
      ]),
    );
  }
}
