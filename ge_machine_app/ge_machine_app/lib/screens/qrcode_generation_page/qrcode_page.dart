import 'package:flutter/material.dart';
import 'package:ge_machine_app/dimensions.dart';
import 'package:ge_machine_app/controllers/bluetooth_controller.dart';
import 'package:ge_machine_app/screens/qrcode_generation_page/qrcode_generation_page_components/column_under_qr_code.dart';
import 'package:ge_machine_app/screens/qrcode_generation_page/qrcode_generation_page_components/details_above_qrcode.dart';
import 'package:ge_machine_app/screens/qrcode_generation_page/qrcode_generation_page_components/page_background_image.dart';
import 'package:ge_machine_app/services/operations_box.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QrcodePage extends StatelessWidget {
  QrcodePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            const QrcodePageBackgroundImage(),
            Positioned(
              left: DeviceDimensions.width * .15,
              child: Column(
                children: [
                  /**
                   * Green Egypt logo and text
                   * with some notes in text .
                   */
                  DetailsAboveQrcode(),
                  const SizedBox(
                    height: 24,
                  ),
                  GetBuilder<BluetoothController>(builder: (blueController) {
                    return Container(
                      padding: EdgeInsets.all(32),
                      width: DeviceDimensions.width * .25,
                      height: DeviceDimensions.width * .25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: FittedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Scan this qr code : ",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              child: SfBarcodeGenerator(
                                /**
                                 * machine id : GE-A1 
                                 * number of plastics ,
                                 * number of cans ,
                                 * number of points ,
                                 * date of process ,
                                 * time of process with secons,
                                 */
                                value:
                                    'GE-A1,${OperationsBox.instance.lastOperationNumber},${blueController.plastic_items},${blueController.cans_items},${DateFormat('yyyy-MM-dd').format(DateTime.now())},${DateFormat.Hms().format(DateTime.now())}',
                                symbology: QRCode(),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Plastic : ${blueController.plastic_items} , Can : ${blueController.cans_items}, Points : ${blueController.points}",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 24,
                  ),

                  /**
                   * Done Button .
                   * Auto navigation Text .
                   */
                   ColumnUnderQrCode()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
