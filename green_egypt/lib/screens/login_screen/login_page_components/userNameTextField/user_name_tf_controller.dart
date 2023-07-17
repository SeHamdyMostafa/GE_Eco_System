import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNameTFController extends GetxController {
  Color labelColor = Colors.grey[350]!;

  void changeLabelColorToFocus() {
    labelColor =Colors.green;
    update();
  }

  void changeLabelColorToLeave() {
     labelColor = Colors.grey[350]!;
     update();
  }
}
