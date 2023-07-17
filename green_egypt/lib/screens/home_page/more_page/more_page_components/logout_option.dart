import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LogoutOption extends StatelessWidget {
  late ApplicationThemeController applicationThemeController;
  LogoutOption({required this.applicationThemeController});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      onTap: () async {
        Get.offAllNamed(PagesNames.loginScreen);
        UserDataBox.instance.userLoggedOut();
        await GoogleSignIn().signOut();
        await FirebaseAuth.instance.signOut();
      },
      leading: Icon(
        Icons.login_sharp,
        color: applicationThemeController.isDark ? Colors.white : Colors.black,
      ),
      title: Text('Logout'.tr),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18.sp,
        color: Colors.grey,
      ),
    );
  }
}
