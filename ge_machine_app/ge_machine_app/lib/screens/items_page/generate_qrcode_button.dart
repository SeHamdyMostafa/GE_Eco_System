import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:ge_machine_app/dimensions.dart';
import 'package:ge_machine_app/screens/qrcode_generation_page/qrcode_page.dart';
import 'package:get/get.dart';

class GenerateQrcodeButton extends StatelessWidget {
  const GenerateQrcodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 3),
          borderRadius: BorderRadius.circular(32)),
      width: DeviceDimensions.width * .25,
      child: SwipeButton.expand(
        thumb: Icon(
          Icons.double_arrow_rounded,
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Swipe to generate",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.qr_code_2_outlined,
              size: 28,
            )
          ],
        ),
        borderRadius: BorderRadius.circular(32),
        activeThumbColor: Colors.green,
        activeTrackColor: Colors.white,
        onSwipe: () {
          Get.to(
            () => QrcodePage(),
            transition: Transition.fade,
            curve: Curves.easeInOutCubic,
            duration: Duration(milliseconds: 500),
          );
        },
      ),
    );
  }
}
