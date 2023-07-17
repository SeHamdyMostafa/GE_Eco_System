import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:ge_machine_app/features/console_messages.dart';
import 'package:ge_machine_app/features/custom_toast.dart';
import 'package:ge_machine_app/screens/home_page/home_page.dart';
import 'package:ge_machine_app/screens/items_page/items_page.dart';
import 'package:ge_machine_app/services/operations_box.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  @override
  void onInit() async {
    _pageIndex = 0;
    resetItems();
    try {
      initiateConnection();
      await OperationsBox.instance.init_OperationsBox();
    } catch (e) {
      ConsoleMessage.printError('Error in Bluetooth Controller Constructor', e);
    }
    super.onInit();
  }

  late int _pageIndex;
  late int plastic_items;
  late int cans_items;
  late int points;
  bool firstTimeEstablishConnection = false;
  late double operationNumber;

  late BluetoothDevice arduniDevice;

  late String connection_status;
  String connection_status_message = '';
  String connect_status_not_connected = 'not connected';
  String connect_status_connected = 'connected';
  String connect_status_connecting = 'connecting';
  Widget showProgressIndicator = SizedBox();

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
    connection_status = connect_status_not_connected;
    connection_status_message = connect_status_not_connected;
    showProgressIndicator = Text("Machine Status : $connection_status_message");
    update();
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
        if (bondedDevices[i].address == macAddress_arduino_screen) {
          arduniDevice = bondedDevices[i];
          break;
        }
      }
      if (!arduniDevice.isConnected) {
        await connectToScreenBluetoothModule();
      } else {
        Timer(
          Duration(seconds: 5),
          () async {
            await connectToScreenBluetoothModule();
          },
        );
      }
    });
  }

  Future<void> connectToScreenBluetoothModule() async {
    try {
      showConnectingStatus();
      /**
       * to connect with bluetooth module .
       */

      await BluetoothConnection.toAddress(macAddress_arduino_screen)
          .then((value) async {
        connection = value;
        print('''\n\n\n Connected ✅ \n\n\n''');
        showConnectedStatus();
        await startListeningToBluetoothStream();
        print('''\n\n\n Listening ✅ \n\n\n''');
      });
    } catch (e) {
      Timer(
        Duration(seconds: 2),
        () async {
          await connectToScreenBluetoothModule();
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
      // showConnectedAndListeningStatus();
      connection.input!.listen(
        (Uint8List data) {
          _pageIndex == 0 ? navigateToItemsPage() : null;
          try {
            String comingMessage = utf8.decode(data);
            ConsoleMessage.printMessage('coming data : $comingData');
            if (int.parse(comingMessage[3]) == 1 &&
                int.parse(comingMessage[5]) == 1) {
              increamentPlastic();
              increamentCans();
            } else if (int.parse(comingMessage[3]) == 1) {
              increamentPlastic();
            } else if (int.parse(comingMessage[5]) == 1) {
              increamentCans();
            }
          } catch (e) {
            ConsoleMessage.printError(e, 'decoded data is empty');
          }
          /**
         * Coming message must end with '.'
         * to print coming message only 1 time .
         */
          // if(data[data.last]==46){
          // ConsoleMessage.printMessage('${ascii.decode(data)}');
          // },
          ConsoleMessage.printMessage('${ascii.decode(data)}');
        },
        onDone: () {
          // this is to make application reconnect again of the connection lost .
          connectToScreenBluetoothModule();
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

  // void sendMessage({required String message}) async {
  //   message = message + "\n";
  //   var data = ascii.encode(message);
  //   try {
  //     connection.output.add(data); // Sending data
  //   } catch (e) {
  //     ConsoleMessage.printError(
  //         'error while sending message to camera', e.toString());
  //   }
  // }

  void showConnectedStatus() {
    /**
         * Change connection_status to Connected .
         */
    connection_status = connect_status_connected;
    connection_status_message = connect_status_connected;
    showProgressIndicator = Row(
      children: [
        Text("Machine status : $connect_status_connected"),
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.white,
        )
      ],
    );
    update();
  }

  void showConnectingStatus() {
    connection_status = connect_status_connecting;
    connection_status_message = connect_status_connecting;
    showProgressIndicator = Row(
      children: [
        Text("Machine Status : $connection_status_message"),
        SizedBox(
          width: 8,
        ),
        CircularProgressIndicator(
          color: Colors.white,
        )
      ],
    );
    update();
  }

  void showNotConnectedStatus() {
    connection_status = connect_status_not_connected;
    connection_status_message = connect_status_not_connected;
    showProgressIndicator = Row(
      children: [
        Text("Machine Status : $connection_status_message - Reconnicting"),
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
        )
      ],
    );
    update();
  }

  void showConnectedAndListeningStatus() {
    showProgressIndicator = Row(
      children: [
        Text("Machine Status : $connection_status_message , Started Listening"),
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.hearing,
          color: Colors.white,
        )
      ],
    );
    update();
  }

  Future<void> closeConnection() async {
    await connection.close();
  }

  void increamentPlastic() {
    plastic_items++;
    points += 2;
    update();
  }

  void increamentCans() {
    cans_items++;
    points += 3;
    update();
  }

  void resetItems() {
    plastic_items = 0;
    cans_items = 0;
    points = 0;
    update();
  }

  void navigateToItemsPage() {
    resetItems();
    Get.to(() => ItemsPage(),
        transition: Transition.downToUp,
        curve: Curves.easeInOutCubic,
        duration: Duration(milliseconds: 500));
    _pageIndex++;
  }

  void navigateToHomePage() {
    _pageIndex = 0;
    resetItems();
    Get.off(() => HomePage(),
        transition: Transition.leftToRight,
        curve: Curves.easeInCubic,
        duration: Duration(milliseconds: 500));
  }
}
