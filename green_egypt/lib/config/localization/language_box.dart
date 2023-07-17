import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:hive/hive.dart";
import 'package:hive_flutter/hive_flutter.dart';

class LanguageBox {
  /**
   * Create class as Singleton :
   */

  LanguageBox._privateConstructor();

  static final LanguageBox _instance = LanguageBox._privateConstructor();

  static LanguageBox get instance => _instance;

  /**
   * class Variables 
   */

  late Box language_box;
  final _key_boxName = 'language_box';
  final _key_lang = 'app_lang';
  late String applicationLanguageCode;
  late Locale applicationLanguageLocal;
  /**
   * init language box with device default language : 
   */

  Future<void> initLanguageBox() async {
    language_box = await Hive.openBox(_key_boxName);
    applicationLanguageCode = getApplicationLanguage();
    applicationLanguageLocal = Locale(applicationLanguageCode);
  }

  Future<void> changeApplicationLanguage({required String languageCode}) async {
    // change stored language code .
    applicationLanguageCode = languageCode;
    // change stored application local .
    applicationLanguageLocal = Locale(languageCode);
    await language_box.put(_key_lang, languageCode);
  }

  String getApplicationLanguage() {
    return language_box.get(_key_lang,
        defaultValue: Get.deviceLocale!.languageCode);
  }
}
