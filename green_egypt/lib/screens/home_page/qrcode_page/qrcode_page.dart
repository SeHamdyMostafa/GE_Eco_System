import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/controller/qrcode_page_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodePageBody extends StatefulWidget {
  const QrCodePageBody({super.key});

  @override
  State<QrCodePageBody> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePageBody> {
  int _pageIndex = 1;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String qrcodeScanningStatus = "";

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    // resumeCamera();
    return GetBuilder<ApplicationThemeController>(builder: (themeController) {
      return Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red, borderRadius: 16.0),
              cameraFacing: CameraFacing.back,
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}  \nData: ${result!.code} \n qrcode scanning status : ${qrcodeScanningStatus}')
                  : Text('Scan a code'.tr),
            ),
          )
        ],
      );
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      await controller.pauseCamera().then((value) {
/**
         * readed data form from qrcode : 'GE-A1,${OperationsBox.instance.lastOperationNumber},${blueController.plastic_items},${blueController.cans_items},${DateFormat('yyyy-MM-dd').format(DateTime.now())},${DateFormat.Hms().format(DateTime.now())}',                 
         * 1. name of machine : GE-A1 "String" .
         * 2. last operation number to prevent user from scanning the same qrcode multiple times "int" .
         * 3. number of plastic items "int" .
         * 4. number of cans items "int" .
         * 5. date "String" .
         * 6. time "String" . 
         */
        String qrcodeDataInString = scanData.code!;
        List<String> qrcodeDataInList = qrcodeDataInString.split(',');
        if (qrcodeDataInList[0] == 'GE-A1') {
          QrcodePageController.instance
              .checkIfQrcodeScannedBeforeThenTakeAction(
                  context: context,
                  qrcodeDataInList: qrcodeDataInList,
                  plasticNumber: qrcodeDataInList[2],
                  cansNumber: qrcodeDataInList[3],
                  totalPointsNumber: (int.parse(qrcodeDataInList[2]) * 2 +
                          int.parse(qrcodeDataInList[3]) * 3)
                      .toString(),
                  cameraController: controller);
        }
        // TODO : get data from QR and store points into user Points .
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
