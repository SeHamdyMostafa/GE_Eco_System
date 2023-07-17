import 'dart:ui';

import 'package:get/get.dart';

class localController extends GetxController {
  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    Get.updateLocale(locale);
  }
}
