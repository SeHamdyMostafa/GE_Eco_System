import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordTFController extends GetxController {
  Color pLabelColor = Colors.grey[350]!;

  void changeLabelColorToFocus() {
    pLabelColor =Colors.green;
    update();
  }

  void changeLabelColorToLeave() {
     pLabelColor = Colors.grey[350]!;
     update();
  }
}
