import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetCashPageController extends GetxController {
  late double opacity;

  @override
  void onInit() {
    opacity = 0;
    update();
    super.onInit();
  }

  @override
  void onReady() {
    Timer(
      Duration(milliseconds: 500),
      () {
        opacity = 1;
        update();
      },
    );

    super.onReady();
  }
}
