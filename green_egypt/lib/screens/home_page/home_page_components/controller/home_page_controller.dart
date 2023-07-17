import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/qrcode_page.dart';

class HomePageController extends GetxController {
  HomePageController._privateConstructor();

  static final HomePageController _instance =
      HomePageController._privateConstructor();

  static HomePageController get instance => _instance;

  int pageIndex = 0;

  List<String> homePagesNames = [
    PagesNames.homePage,
    PagesNames.qrcodePage,
    PagesNames.transactionsHistoryPage,
    PagesNames.morePage
  ];

  void changePageIndex({required newIndex}) {
    pageIndex = newIndex;
    update();
  }
}
