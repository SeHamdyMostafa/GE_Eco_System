import 'package:flutter/material.dart';
import 'package:ge_machine_app/dimensions.dart';
import 'package:ge_machine_app/controllers/bluetooth_controller.dart';
import 'package:ge_machine_app/screens/items_page/items_page.dart';
import 'package:get/get.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BluetoothController>(builder: (controller) {
      return Positioned(
        top: DeviceDimensions.height * .8,
        left: DeviceDimensions.width * .15,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xFF7BA744),
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              )),
          child: Row(
            children: [
             const Text(
                "Tap to start",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                width: 8,
              ),
             const  Icon(
                Icons.flag_circle_outlined,
                size: 28,
              ),
             const  SizedBox(
                width: 8,
              ),
              controller.showProgressIndicator
            ],
          ),
          onPressed: () {
            controller.navigateToItemsPage();
          },
        ),
      );
    });
  }
}
