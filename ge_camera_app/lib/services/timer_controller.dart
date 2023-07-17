import 'dart:async';

import 'package:ge_camera_app/services/isolate.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  bool sendSignal = true;

  Future<void> enableSendingSignal() async {
    Timer(
      Duration(seconds: 8),
      () {
        sendSignal = true;
        update();
      },
    );
  }

  void stunSendingSignal() async {
    sendSignal = false;
    update();
    await enableSendingSignal();
  }
}
