import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:green_egypt/config/theme/application_theme.dart';

class ApplicationThemeController extends GetxController {
  /**
   * Create singleton for class 
   */

  ApplicationThemeController._privateConstructor();

  static final ApplicationThemeController _instance =
      ApplicationThemeController._privateConstructor();

  static ApplicationThemeController get instance => _instance;
  /**
   * Class Variables : 
   */

  String _key_applicatioThemeBox = "application_theme_box";
  String _key_isDarkBool = 'is_dark';

  late Box applicationThemeBox;

  late bool isDark;

  late ThemeData currentTheme;

  Future<void> initApplicationThemeController_ThemeAndBox() async {
    /**
     * create instance of currentThemeSharedPref
     */
    currentTheme = ApplicationTheme.applicationLightTheme;
    applicationThemeBox = await Hive.openBox(_key_applicatioThemeBox);

    isDark = applicationThemeBox.get(_key_isDarkBool, defaultValue: false);

    if (isDark == false)
      currentTheme = ApplicationTheme.applicationLightTheme;
    else
      currentTheme = ApplicationTheme.applicationDarkTheme;
    update();
  }

/**
 * change the theme of the application
 */
  Future<void> changeApplicationTheme({required bool newValue}) async {
    /**
     * change value of currentTheme that stored in SharedPref .
     */

    await applicationThemeBox.put(_key_isDarkBool, newValue);
    isDark = newValue;
    if (newValue == true)
      currentTheme = ApplicationTheme.applicationDarkTheme;
    else
      currentTheme = ApplicationTheme.applicationLightTheme;
    update();
  }
}
