import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/home_page_components/controller/home_page_controller.dart';
import 'package:green_egypt/services/boxes/transactions_box.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:green_egypt/services/console_message.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrcodePageController {
  QrcodePageController._privateConstructor();

  static final QrcodePageController _instance =
      QrcodePageController._privateConstructor();

  static QrcodePageController get instance => _instance;

  late Box lastOperationBox;

  late int lastOperationNumber;

  String _boxKey_lastOperationBox = 'last_operation_box_key';

  String _key_last_operation = 'last_operation_key';

  Future<void> init_lastOperationBox() async {
    lastOperationBox = await Hive.openBox(_boxKey_lastOperationBox);
    lastOperationNumber =
        lastOperationBox.get(_key_last_operation, defaultValue: 0);
    ConsoleMessage.successMessage('last Operation box openned successfully');
  }

  Future<void> clear_lastOperationNumber() async {
    await lastOperationBox.put(_key_last_operation, 0);
    lastOperationNumber = 0;
  }

  Future<bool> checkAndStore_storedLastOperationNom_with_NewLastOperationNumber(
      {required int newLastOperationNumber}) async {
    late bool b;
    if (newLastOperationNumber == lastOperationNumber) {
      b = false;
    } else {
      await lastOperationBox.put(_key_last_operation, newLastOperationNumber);
      lastOperationNumber = newLastOperationNumber;
      b = true;
    }
    return b;
  }

  void checkIfQrcodeScannedBeforeThenTakeAction(
      {required List<String> qrcodeDataInList,
      required BuildContext context,
      required String plasticNumber,
      required String cansNumber,
      required String totalPointsNumber,
      required QRViewController cameraController}) {
    /**
    * if the qrcode scanned before , then it will return false .
    */
    QrcodePageController.instance
        .checkAndStore_storedLastOperationNom_with_NewLastOperationNumber(
            newLastOperationNumber: int.parse(qrcodeDataInList[1]))
        .then((value) {
      if (value == true) {
        /**
         * Show Transaction done dialog
         */
        showTransactionDoneSheet(
            context: context,
            plasticNumber: plasticNumber,
            cansNumber: cansNumber,
            qrcodeDataInList: qrcodeDataInList,
            totalPointsNumber: totalPointsNumber,
            cameraController: cameraController);
      } else {
        showQrcodeScannedBeforeBottomSheet(context: context);
      }
    });
  }

  void showTransactionDoneSheet(
      {required BuildContext context,
      required String plasticNumber,
      required String cansNumber,
      required String totalPointsNumber,
      required List<String> qrcodeDataInList,
      required QRViewController cameraController}) {
    showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext) {
          return Container(
            width: Dimensions.width,
            height: Dimensions.height * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: Dimensions.width * .3,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(36)),
                ),
                 Text(
                  "Transaction Done" .tr,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Lottie.asset("assets/animated_vectors/transaction_done.json",
                    height: Dimensions.height * 0.16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Items :".tr,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "$plasticNumber Plastic ," .tr,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " $cansNumber Cans ,".tr,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " $totalPointsNumber Points".tr,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 45),
                        primary: Color(0xffdc9c41),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () async {
                        await clear_lastOperationNumber();
                        /**
                         * Remove bottom sheet
                         */
                        Get.back();
                        /**
                         * resume camera Capturning .
                         */
                        await cameraController.resumeCamera();
                      },
                      icon: Icon(
                        Icons.qr_code,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Rescan".tr,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 45),
                        primary: Color(0xff4cd18c),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        /**
                                 * Store Verified qrcode data in transactions DB . 
                                 */
                        TransactionsBox.instance.addTransaction({
                          'plastic': qrcodeDataInList[2],
                          'cans': qrcodeDataInList[3],
                          'points': (int.parse(qrcodeDataInList[2]) * 2 +
                              int.parse(qrcodeDataInList[3]) * 3),
                          'date': qrcodeDataInList[4],
                          'time': qrcodeDataInList[5],
                        });
                        /**
                                 * Store items numbers and points in User DB .
                                 */
                        UserDataBox.instance
                            .put_increamentRecycledPasticItemsNumber(
                                plasticItemsNumber:
                                    int.parse(qrcodeDataInList[2]));
                        UserDataBox.instance
                            .put_increamentRecycledCansItemsNumber(
                                cansItemsNumber:
                                    int.parse(qrcodeDataInList[3]));
                        UserDataBox.instance.put_newPoints(
                            points: (int.parse(qrcodeDataInList[2]) * 2 +
                                int.parse(qrcodeDataInList[3]) * 3));
                        /**
                                 * Remove loading indicator .
                                 */
                        Get.back();
                        /**
                                 * Auto navigate to transactions page .
                                 */
                        HomePageController.instance
                            .changePageIndex(newIndex: 2);

                        /**
                         * remove Bottom dialog .
                         */
                        Get.back();
                      },
                      icon: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      label: Text(
                        "I'm done".tr,
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  void showQrcodeScannedBeforeBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: Dimensions.height * .4,
          width: Dimensions.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              Container(
                width: Dimensions.width * .3,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.withOpacity(.8)),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Warning".tr,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 12,
              ),
              Lottie.asset('assets/animated_vectors/warning.json',
                  width: Dimensions.width * .25),
              SizedBox(
                height: 12,
              ),
              Text(
                "This Qrcode Scanned before !!".tr,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 24,
              ),
              OutlinedButton(
                onPressed: () {
                  /**
                     * Remove Bottom Sheet
                     */
                  Get.back();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Back".tr,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
              )
            ],
          ),
        );
      },
    );
  }
}
