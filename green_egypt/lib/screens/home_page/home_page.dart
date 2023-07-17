import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/screens/home_page/home_page_components/controller/home_page_animations_controller.dart';
import 'package:green_egypt/screens/home_page/home_page_components/widgets/home_page_appbar.dart';
import 'package:green_egypt/screens/home_page/home_page_components/components/home_page_body.dart';
import 'package:green_egypt/screens/home_page/home_page_components/controller/home_page_controller.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/qrcode_page.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/components/qrcode_page_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_body.dart';

class HomePage extends StatefulWidget {
  final homePageAnimationsController = Get.put(HomePageAnimationsController());
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController.instance,
        builder: (controller) {
          return Scaffold(
              appBar: controller.pageIndex == 0
                  ? homePageAppBar
                  : controller.pageIndex == 1
                      ? qrcodePageAppbar
                      : controller.pageIndex == 2
                          ? null
                          : AppBar(
                              title: Text('more page'.tr),
                            ),
              bottomNavigationBar: GetBuilder<ApplicationThemeController>(
                  builder: (themeController) {
                return BottomNavyBar(
                  backgroundColor: ApplicationThemeController.instance.isDark
                      ? Colors.black
                      : Colors.white,
                  selectedIndex: controller.pageIndex,
                  curve: Curves.linear,
                  iconSize: 20.sp,
                  items: [
                    BottomNavyBarItem(
                        icon: const Icon(
                          Icons.home_outlined,
                          size: 24,
                        ),
                        title: Text('home'.tr),
                        textAlign: TextAlign.center,
                        activeColor: Color(0xFF90AD19),
                        inactiveColor:
                            ApplicationThemeController.instance.isDark
                                ? Colors.white
                                : Colors.black),
                    BottomNavyBarItem(
                        icon: const Icon(
                          Icons.qr_code_scanner_rounded,
                          size: 24,
                        ),
                        title: Text("qr code".tr),
                        textAlign: TextAlign.center,
                        activeColor: Color(0xFF90AD19),
                        inactiveColor:
                            ApplicationThemeController.instance.isDark
                                ? Colors.white
                                : Colors.black),
                    BottomNavyBarItem(
                        icon: const Icon(
                          Icons.bookmarks_outlined,
                          size: 24,
                        ),
                        title: Text("Transactions".tr),
                        textAlign: TextAlign.center,
                        activeColor: Color(0xFF90AD19),
                        inactiveColor:
                            ApplicationThemeController.instance.isDark
                                ? Colors.white
                                : Colors.black),
                    BottomNavyBarItem(
                        icon: const Icon(
                          Icons.more_horiz_outlined,
                          size: 24,
                        ),
                        title: Text("more".tr),
                        textAlign: TextAlign.center,
                        activeColor: Color(0xFF90AD19),
                        inactiveColor:
                            ApplicationThemeController.instance.isDark
                                ? Colors.white
                                : Colors.black),
                  ],
                  onItemSelected: (value) {
                    setState(() {
                      controller.pageIndex = value;
                    });
                  },
                );
              }),
              body: controller.pageIndex == 0
                  ? homePageBody
                  : controller.pageIndex == 1
                      ? QrCodePageBody()
                      : controller.pageIndex == 2
                          ? TransactionPageBody()
                          : controller.pageIndex == 3
                              ? MorePageBody()
                              : const SizedBox());
        });
  }
}
