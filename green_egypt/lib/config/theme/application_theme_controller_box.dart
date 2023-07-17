import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme.dart';
import 'package:green_egypt/services/console_message.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    ConsoleMessage.successMessage(
        'Start initiating Application theme controller box ');
    /**
     * create instance of currentThemeSharedPref
     */
    applicationThemeBox = await Hive.openBox(_key_applicatioThemeBox);
    ConsoleMessage.successMessage('application theme box opened');
    isDark = applicationThemeBox.get(_key_isDarkBool, defaultValue: false);
    ConsoleMessage.successMessage('is dark = $isDark');
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
