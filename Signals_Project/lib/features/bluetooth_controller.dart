import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:signals_app/features/console_messages.dart';
import 'package:signals_app/features/custom_toast.dart';

class BluetoothController extends GetxController {
  late String connection_status;
  String connection_status_message = '';
  late BluetoothDevice arduniDevice;

  String comingData = "";

  int numberOfTries = 0;

  Widget showProgressIndicator = SizedBox();

  String macAddress_tablet = "0C:2F:B0:FE:ED:23";
  String macAddress_camera = "F4:63:1F:D0:03:4E";
  String macAddress_arduino_camera = "00:21:09:00:4F:8C";
  String macAddress_arduino_screen = "00:21:09:00:4D:35";

  String connect_status_not_connected = 'not connected';
  String connect_status_connected = 'connected';
  String connect_status_connecting = 'connecting';

  late BluetoothConnection connection;

  @override
  void onInit() {
    connection_status = connect_status_not_connected;
    initiateConnection();
    super.onInit();
  }

  /**
   * After the connection has been Stablished , 
   * show all bonded device to get HC-05 Bluetooth module 
   * to connect with ✅ .
   */
  Future<void> getAllBoundedDeviceThenStartConnection() async {
    // get all bonded devices on tablet .
    var bondedDevices =
        await FlutterBluetoothSerial.instance.getBondedDevices();
    for (int i = 0; i < bondedDevices.length; i++) {
      if (bondedDevices[i].address == macAddress_arduino_camera) {
        arduniDevice = bondedDevices[i];
        break;
      }
    }
    if (!arduniDevice.isConnected) {
      await connectToCameraBluetoothModule();
    }
  }

  void initiateConnection() async {
    bool? isEnabled = await FlutterBluetoothSerial.instance.isEnabled;
    if (isEnabled!) {
      await getAllBoundedDeviceThenStartConnection();
    } else {
      await FlutterBluetoothSerial.instance.requestEnable().then((value) async {
        if (value == true) {
          await getAllBoundedDeviceThenStartConnection();
        }
      });
    }
  }

  Future<void> connectToCameraBluetoothModule() async {
    if (connection_status == connect_status_not_connected) {
      try {
        /**
         * Change connection_status to Connecting
         */
        connection_status = connect_status_connecting;
        connection_status_message = connect_status_connecting;
        showProgressIndicator = CircularProgressIndicator(
          color: Colors.grey,
        );
        update();
        /**
       * to connect with bluetooth module .
       */

        await BluetoothConnection.toAddress(macAddress_arduino_camera).then(
          (value) async {
            connection = value;
            /**
         * Change connection_status to Connected .
         */
            connection_status = connect_status_connected;
            connection_status_message = connect_status_connected;
            showProgressIndicator = Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.green,
            );
            update();
            connection.input!.listen(
              (event) {},
              onDone: () => connectToCameraBluetoothModule(),
            );
          },
        );
      } catch (e) {
        numberOfTries += 1;
        connection_status = connect_status_not_connected;
        connection_status_message =
            '$connect_status_not_connected - $numberOfTries';
        showProgressIndicator = Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
        );
        update();
        Timer(Duration(seconds: 1), () async {
          await connectToCameraBluetoothModule();
        });
      }
    } else {
      CustomToast.showRedToast(message: 'Already Connected !!');
    }
  }

  List<int> messageToBytes(String str) {
    return str.codeUnits.map((codeUnit) => codeUnit & 0xff).toList();
  }

  // Future<void> startListeningToBluetoothStream() async {
  //   try {
  //     ConsoleMessage.printMessage('start listening to Aurdino');
  //     connection.input!.listen((Uint8List data) {
  //       /**
  //        * Coming message must end with '.'
  //        * to print coming message only 1 time .
  //        */
  //       // if(data[data.last]==46){
  //       // ConsoleMessage.printMessage('${ascii.decode(data)}');
  //       // },
  //       ConsoleMessage.printMessage('${ascii.decode(data)}');
  //     });
  //   } catch (e) {
  //     ConsoleMessage.printError(
  //         'error while listening to camera', e.toString());
  //     CustomToast.showRedToast(message: e.toString());
  //   }
  // }

  void sendMessage({required String message}) async {
    message = message + "\n";
    var data = ascii.encode(message);
    try {
      connection.output.add(data); // Sending data
    } catch (e) {
      ConsoleMessage.printError(
          'error while sending message to camera', e.toString());
    }
  }

  void closeConnection() {
    connection.close();
  }
}
