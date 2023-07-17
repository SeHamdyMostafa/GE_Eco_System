import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/localization/language_box.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../config/localization/locale_controller.dart';

class LanguageOption extends StatelessWidget {
  late ApplicationThemeController applicationThemeController;
  LanguageOption({required this.applicationThemeController});

  @override
  Widget build(BuildContext context) {
    localController applicationLangController = Get.find();
    return ListTile(
      horizontalTitleGap: 0,
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          context: context,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                color: applicationThemeController.isDark
                    ? Colors.black
                    : Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
              ),
              height: Dimensions.height * .3,
              child: FittedBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height * .03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[300],
                      ),
                      width: Dimensions.width * .2,
                      height: 8,
                    ),
                    SizedBox(
                      height: Dimensions.height * .03,
                    ),
                    Text('Select your Language :'.tr),
                    SizedBox(
                      height: Dimensions.height * .03,
                    ),
                    Container(
                      width: Dimensions.width * .4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: applicationThemeController.isDark
                                  ? Colors.white
                                  : Colors.black)),
                      child: ListTile(
                        onTap: () async {
                          applicationLangController.changeLang("en");
                          await LanguageBox.instance
                              .changeApplicationLanguage(languageCode: 'en');
                        },
                        leading: Text('ENGLISH'.tr),
                        trailing:
                            LanguageBox.instance.applicationLanguageCode == 'en'
                                ? Icon(
                                    Icons.check_circle_outline,
                                    color: DefaultColors.defaultGreen,
                                  )
                                : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height * .03,
                    ),
                    Container(
                      width: Dimensions.width * .4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: applicationThemeController.isDark
                                  ? Colors.white
                                  : Colors.black)),
                      child: ListTile(
                        onTap: () async {
                          applicationLangController.changeLang("ar");
                          await LanguageBox.instance
                              .changeApplicationLanguage(languageCode: 'ar');
                        },
                        leading: Text('ARABIC'.tr),
                        trailing:
                            LanguageBox.instance.applicationLanguageCode == 'ar'
                                ? Icon(
                                    Icons.check_circle_outline,
                                    color: DefaultColors.defaultGreen,
                                  )
                                : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height * .03,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      leading: Icon(
        Icons.language_rounded,
        color: Colors.purple[300],
      ),
      title: Text('Language'.tr),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LanguageBox.instance.applicationLanguageCode == 'en'
                ? 'English'.tr
                : "Arabic".tr,
            style: TextStyle(color: Colors.grey[500]),
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18.sp,
          ),
        ],
      ),
    );
  }
}
