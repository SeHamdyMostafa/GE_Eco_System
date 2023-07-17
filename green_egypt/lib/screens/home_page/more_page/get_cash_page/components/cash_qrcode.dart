import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../../../config/theme/application_theme_controller_box.dart';

class CashQrcode extends StatelessWidget {
  const CashQrcode({super.key});

  @override
  Widget build(BuildContext context) {
        return GetBuilder<ApplicationThemeController>(builder: (themeController) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          child: SfBarcodeGenerator(
            value: '35 Points : 4.5 le'.tr,
            symbology: QRCode(),
            backgroundColor: themeController.isDark
                      ? const Color.fromARGB(255, 25, 25, 25)
                      : const Color.fromARGB(255, 235, 235, 235),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "35 point : 12 le".tr,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
           color: ApplicationThemeController.instance.isDark
            ? Colors.white
            : Colors.black),
        )
      ],
    );
    });
  }
}
