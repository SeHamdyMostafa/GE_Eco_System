import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class GEIsolate extends GetxController {
  GEIsolate._privateConstructor();

  static final GEIsolate _instance = GEIsolate._privateConstructor();

  static GEIsolate get instance => _instance;

  bool able_to_send_signal = true;

  late ReceivePort receivePort1;
  late SendPort sendPort;
// create isolate
  late Isolate isolate;
  void initIsolate() {
    // create receiver Object .
    receivePort1 = ReceivePort();
    sendPort = receivePort1
        .sendPort; // create sender onject and link it with above 👆 reciever object .
  }

  Future<void> spawnTimerIsolate() async {
    isolate = await Isolate.spawn((SendPort sendPort) {
      Timer(
        Duration(seconds: 3),
        () {
          able_to_send_signal = true;
          showToast(message: 'sending signal is become true');
          update();
        },
      );
    }, sendPort);

    receivePort1.listen((message) {
      // in recieve i just want to print comming message from sender :
      print('Received message from isolate 1: $message');
    });
  }

  void showToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}
