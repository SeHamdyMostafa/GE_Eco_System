import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/default_colors.dart';

import 'package:page_transition/page_transition.dart';

class RegisterAndForgetPasswordRow extends StatelessWidget {
  const RegisterAndForgetPasswordRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /**
           * Register Button
           */
          OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: DefaultColors.defaultGreen)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: DefaultColors.defaultGreen),
                      borderRadius: BorderRadius.circular(28))),
            ),
            /**
             * Register Button Function
             */
            onPressed: () {
              Get.toNamed(PagesNames.registerPage);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Register    ".tr,
                  style: Theme.of(context).textTheme.button,
                ),
                FaIcon(
                  FontAwesomeIcons.arrowRight,
                  color: DefaultColors.defaultGreen,
                  size: 12,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO add forget password Feature .
              Fluttertoast.showToast(
                  msg: "this Function isn't Available now !!",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.black);
            },
            child: Text(
              "Forgot Password?".tr,
              style: TextStyle(color: DefaultColors.defaultGreen, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
