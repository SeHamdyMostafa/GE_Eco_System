import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/default_colors.dart';

class StartScreenLoginButton extends StatelessWidget {
  const StartScreenLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(color: DefaultColors.defaultGreen),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(DefaultColors.defaultGreen)),
      onPressed: () {
        Get.toNamed(PagesNames.loginScreen);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login".tr,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.done_all_outlined,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
