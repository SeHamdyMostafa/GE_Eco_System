import 'package:green_egypt/config/localization/language_box.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/controller/qrcode_page_controller.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';
import 'package:green_egypt/services/boxes/transactions_box.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';

class SharedPreferencesClass {
  static Future<void> initAllSharedPreferences() async {
    /**
     * init language box to retrieve last stored language on application .
     */
    await LanguageBox.instance.initLanguageBox();
    // user Data Box that contain all user data stored in .
    // boxes are local storing objects as Shared Preferences put with extra speed .
    UserDataBox.instance.initiateUserBox();
   
    await QrcodePageController.instance.init_lastOperationBox();
    // initialize First launch Shared pref to decide Navigation Destination .
    await FirstLaunch.init();

     await TransactionsBox.instance.init_TransactionsBox();
  }
}
