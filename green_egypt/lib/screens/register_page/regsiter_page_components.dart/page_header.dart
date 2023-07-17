import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/config/vectos_paths.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Lottie.asset('assets/animated_vectors/register_animation.json',
              frameRate: FrameRate.max),
        ),
        SizedBox(
          height: 18,
        ),
        /**
                       * Welcome message
                       */
        Align(
          alignment: Alignment.center,
          child: Text(
            "🍀 Regsiter now to be one of Green_Egypt Family 🍀".tr,
            style: TextStyle(fontSize: 15.sp,)
          ),
        ),
        /**
                       * Sign up now message
                       */
        SizedBox(
          height: MediaQuery.of(context).size.height * .04,
        ),
        Text(
          "Enter your Details : ".tr,
          style: TextStyle(fontSize: 18.sp, color: DefaultColors.defaultGreen),
        ),

        /**
                           * Row of first and last name
                           */
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
      ],
    );
  }
}
