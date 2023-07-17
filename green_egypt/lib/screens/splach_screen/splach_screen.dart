import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/images_paths.dart';
import 'package:green_egypt/screens/home_page/home_page.dart';
import 'package:green_egypt/screens/introduction_screen/intro_screen_2.dart';
import 'package:green_egypt/screens/start_screen/start_screen.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplachScreenCustom extends StatelessWidget {
  SplachScreenCustom({super.key});

  @override
  Widget build(BuildContext context) {
    print("Get width : ${Get.mediaQuery.size.width}");
    print("Dimensions width : ${Dimensions.width}");
    print("context width : ${context.width}");
    return AnimatedSplashScreen(
      // time in milli seconds
      duration: 2000,
      /**
       * Fade Animation Duration
       */
      animationDuration: Duration(seconds: 1),
      /**
       * Centeralize image
       */
      centered: true,
      splashIconSize: Get.height,
      splash: Container(
        /**
         * make image take the width of the screen
         */
        width: Get.width,
        /**
         * make image take the height of the screen
         */
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splach_screen_images/splach Screen design.png'),
            fit: BoxFit.cover,
            /**
             * Add darl layer on the image
             */
            // colorFilter: ColorFilter.mode(
            //     Colors.black.withOpacity(0.55), BlendMode.darken),
          ),
        ),
      ),

      nextScreen:
          /**
       * If first Launch Shared preference has value true , 
       * it mean that application opened , so open on login screen 
       * else it mean that it is first time application opened , so
       * open on intro screen .
       */

          FirstLaunch.getFirstLaunchDoneBool()
              ? (UserDataBox.instance.get_loggedInBool()
                  ? HomePage()
                  : StartScreen())
              : IntroductionScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
/**
 * 
 */
