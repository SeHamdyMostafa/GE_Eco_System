import 'package:shared_preferences/shared_preferences.dart';

class FirstLaunch {
  /**
   * Shared preferences Object
   */
  static late SharedPreferences firstLaunchBoolSharedPref;
  static const String firstLaunchTag = 'firstLaunchDone';
  static late bool firstLaunchDoneBool;

  static Future<void> init() async {
    firstLaunchBoolSharedPref = await SharedPreferences.getInstance();
    /**
     * if firstLaunch sharedPref not contain the value of firstlaunchBool ,
     * it mean that the application is first tipme opened , so 
     * make it's value is false .
     * else , it will contain the value then assign the variable with it .
     */

    // if the value == null , it mean app first time opened , assign value with false .
    firstLaunchDoneBool =
        firstLaunchBoolSharedPref.getBool(firstLaunchTag) ?? false;
    firstLaunchBoolSharedPref.getBool(firstLaunchTag) == null
        ? await firstLaunchBoolSharedPref.setBool(firstLaunchTag, false)
        : null;
  }

  // to return stored value

  static bool getFirstLaunchDoneBool() {
    return firstLaunchDoneBool;
  }

  // change firstTimeLaunchBool from false to true .
  static Future<void> changeFirstLaunchValue() async {
    firstLaunchDoneBool =
        await firstLaunchBoolSharedPref.setBool(firstLaunchTag, true);
  }
}
