import 'package:flutter/material.dart';
import 'package:ge_machine_app/dimensions.dart';

class QrcodePageBackgroundImage extends StatelessWidget {
  const QrcodePageBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceDimensions.width,
      height: DeviceDimensions.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/qrcode_page_background.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}
