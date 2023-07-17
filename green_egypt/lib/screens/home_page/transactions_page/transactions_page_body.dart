import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/screens/home_page/transactions_page/components/bottom_container.dart';

import 'components/top_container/Transaction_header.dart';

class TransactionPageBody extends StatelessWidget {
  TransactionPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationThemeController>(builder: (themeController) {
      return SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                /**
                       * upper Container that hold image if item .
                       */
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  expandedHeight: Dimensions.height * 0.62,
                  backgroundColor: themeController.isDark
                      ? Colors.grey.withOpacity(.3)
                      : Color(0xfff7f5f5),
                  flexibleSpace:
                      FlexibleSpaceBar(background: Transaction_header()),
                ),
              ];
            },
            body: BottomContainer()),
      );
    });
  }
}
