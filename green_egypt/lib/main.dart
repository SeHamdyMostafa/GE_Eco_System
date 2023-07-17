 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/localization/language_box.dart';
import 'package:green_egypt/config/localization/locale.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/firebase_options.dart';
import 'package:green_egypt/services/Shared_preferences/shared_preferences_class.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'config/localization/locale_controller.dart';

void main() async {
  // this line because i made main method Async 👀
  WidgetsFlutterBinding.ensureInitialized();
  // initaite Hive Boxes instead of SharedPreferences .
  await Hive.initFlutter();
  await ApplicationThemeController.instance
      .initApplicationThemeController_ThemeAndBox();
  // to initiate all Application Shared Preferences in one line 🔥 .
  await SharedPreferencesClass.initAllSharedPreferences();
  /**f
   * Initializing Firebase on Application Level .
   */
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // run Flutter 🤍
  runApp(GreenEgypt());
}

class GreenEgypt extends StatelessWidget {
  GreenEgypt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // inject local controller to use enable language change option .
    Get.put(localController());
    /**
     * Resposive sizer is a new Package that used to handle Text Size depending on screen Ratio using .sp
     * fontSize : 18.sp -> will take 18% if screen size responsive with it's ratio and orientation .
     */
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        /**
         * Get Builder that will change the theme depending on user choice 
         */
        return GetBuilder<ApplicationThemeController>(
            /**
           * Changing theme logic stored in ApplicationThemeController
           * theme itself is stored in ApplicationTheme .
           */
            init: ApplicationThemeController.instance,
            builder: (controller) {
              return GetMaterialApp(
                translations: ApplicationLocal(),
                // locale: controller.initallang,
                locale: LanguageBox.instance.applicationLanguageLocal,
                /**
                 * Get Current theme and if changed , change application theme .
                 */
                theme: controller.currentTheme,
                /**
             * Application Title
             */
                title: "Green Egypt",
                /**
             * Hide debug banner
             */
                debugShowCheckedModeBanner: false,
                /**
             * all application Routes are stored in 1 variable for cleaner code : 
             */
                getPages: PagesNames.listOfPages,
                /**
             * Application will start from splach Screen , 
             * then intro if application opened for first time .
             * else application will open directly on login if user not logged .
             * if user logged , open on main page "will be implemented tomorrow" .
             */
                initialRoute: PagesNames.splachScreen,
              );
            });
      },
    );
  }
}
