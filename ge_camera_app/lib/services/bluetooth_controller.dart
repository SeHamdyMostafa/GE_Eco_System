import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  @override
  void onInit() async {
    try {
      initiateConnection();
    } catch (e) {
      print('Error in Bluetooth Controller Constructor $e');
    }
    super.onInit();
  }

  late BluetoothDevice arduniDevice;

  String comingData = "";

  String macAddress_tablet = "0C:2F:B0:FE:ED:23";
  String macAddress_camera = "F4:63:1F:D0:03:4E";
  String macAddress_arduino_camera = "00:21:09:00:4F:8C";
  String macAddress_arduino_screen = "00:21:09:00:4D:35";

  late BluetoothConnection connection;

  /**
   * After the connection has been Stablished , 
   * show all bonded device to get HC-05 Bluetooth module 
   * to connect with ✅ .
   */

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

  Future<void> getAllBoundedDeviceThenStartConnection() async {
    // get all bonded devices on tablet .
    await FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((bondedDevices) async {
      for (int i = 0; i < bondedDevices.length; i++) {
        if (bondedDevices[i].address == macAddress_arduino_camera) {
          arduniDevice = bondedDevices[i];
          break;
        }
      }
      if (!arduniDevice.isConnected) {
        await connectToCameraBluetoothModule();
      } else {
        Timer(
          Duration(seconds: 5),
          () async {
            await connectToCameraBluetoothModule();
          },
        );
      }
    });
  }

  Future<void> connectToCameraBluetoothModule() async {
    try {
      /**
       * to connect with bluetooth module .
       */

      await BluetoothConnection.toAddress(macAddress_arduino_camera)
          .then((value) async {
        connection = value;
        print('''\n\n\n Connected ✅ \n\n\n''');
        await startListeningToBluetoothStream();
        print('''\n\n\n Listening ✅ \n\n\n''');
      });
    } catch (e) {
      Timer(
        Duration(seconds: 2),
        () async {
          await connectToCameraBluetoothModule();
        },
      );
      print('''\n\n\n Reconnecting with HC-05 bluetooth \n\n\n''');
    }
  }

  List<int> messageToBytes(String str) {
    return str.codeUnits.map((codeUnit) => codeUnit & 0xff).toList();
  }

  Future<void> startListeningToBluetoothStream() async {
    try {
      connection.input!.listen(
        (Uint8List data) {},
        onDone: () {
          // this is to make Camera reconnect again of the connection lost .
          connectToCameraBluetoothModule();
        },
      );
    } catch (e) {
      print('\n\n Error While listening to HC-05 -> $e');
      // Timer(
      //   Duration(seconds: 5),
      //   () async {
      //     await startListeningToBluetoothStream();
      //   },
      // );
    }
  }

  void sendMessage({required String message}) async {
    message = message + "\n";
    var data = ascii.encode(message);
    try {
      connection.output.add(data); // Sending data
    } catch (e) {
      print('error while sending message to bluetooth module !! $e');
    }
  }

  Future<void> closeConnection() async {
    await connection.close();
  }
}
