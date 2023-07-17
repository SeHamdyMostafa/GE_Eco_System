import 'package:flutter/material.dart';
import 'package:ge_machine_app/controllers/bluetooth_controller.dart';
import 'package:ge_machine_app/screens/items_page/green_divider.dart';
import 'package:ge_machine_app/screens/items_page/items_counters.dart';
import 'package:get/get.dart';

class ItemsCountersContainer extends StatelessWidget {
  const ItemsCountersContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<BluetoothController>(builder: (blueController) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.green, width: 2),
          ),
          padding: EdgeInsets.all(36),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Plastic",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Text(
                      blueController.plastic_items < 10
                          ? "0" + blueController.plastic_items.toString()
                          : blueController.plastic_items.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              // ItemsCounters(
              //   itemName: 'Plastic',
              //   itemCounter: Get.find<BluetoothController>().plastic_items,
              // ),
              GreenDivider(),
              Column(
                children: [
                  Text(
                    "Cans",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Text(
                      blueController.cans_items < 10
                          ? "0" + blueController.cans_items.toString()
                          : blueController.cans_items.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              // ItemsCounters(
              //     itemName: 'Cans', itemCounter: blueController.cans_items),
              GreenDivider(),
              Column(
                children: [
                  Text(
                    "Points",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Text(
                      blueController.points < 10
                          ? "0" + blueController.points.toString()
                          : blueController.points.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              // ItemsCounters(
              //   itemName: 'Points',
              //   itemCounter: blueController.points,
              // )
            ],
          ),
        );
      }),
    );
  }
}
