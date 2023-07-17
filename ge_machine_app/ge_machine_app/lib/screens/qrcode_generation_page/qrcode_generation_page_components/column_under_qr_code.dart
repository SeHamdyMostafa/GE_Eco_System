import 'dart:async';
import 'package:ge_machine_app/controllers/bluetooth_controller.dart';
import 'package:ge_machine_app/services/operations_box.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ge_machine_app/screens/home_page/home_page.dart';

class ColumnUnderQrCode extends StatefulWidget {
  const ColumnUnderQrCode({super.key});
  @override
  State<ColumnUnderQrCode> createState() => _ColumnUnderQrCodeState();
}

class _ColumnUnderQrCodeState extends State<ColumnUnderQrCode> {
  @override
  late Timer _timer;
  int counter = 60;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        timer.cancel();
        Get.find<BluetoothController>().navigateToHomePage();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BluetoothController>(builder: (controller) {
      return Column(
        children: [
          TextButton(
            onPressed: () async{
              /**
               * Increament last operation number to be not duplicated .
               */
              OperationsBox.instance.increamentLastOperationNumber();
              /**
               * Navigate to home page .
               */
              controller.navigateToHomePage();
            },
            child: Row(
              children: [
                Text(
                  "Done",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.done_all,
                  color: Colors.white,
                )
              ],
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
          ),
          SizedBox(
            height: 18,
          ),
          Text("Navigating to Home Page After : $counter second")
        ],
      );
    });
  }
}
