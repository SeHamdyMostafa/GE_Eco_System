import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signals_app/dimensions.dart';
import 'package:signals_app/features/bluetooth_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signals App"),
        centerTitle: true,
      ),
      body: Container(
        height: DeviceDimensions.height,
        width: DeviceDimensions.width,
        child: GetBuilder<BluetoothController>(
            init: BluetoothController(),
            builder: (bl_controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Connection Status : ${bl_controller.connection_status_message}"),
                      SizedBox(
                        width: 12,
                      ),
                      bl_controller.showProgressIndicator,
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        /**
                       * 2 : mean this message is from camera
                       * 1 : mean open plastic hole .
                       * 0 : mean there is no cans .
                       */
                        bl_controller.sendMessage(message: '"1,1,0,"');
                      },
                      child: Text("Send Plastic signal")),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        /**
                       * 2 : mean this message is from camera
                       * 0 : mean there is no plastic .
                       * 1 : mean open cans hole .
                       */
                        bl_controller.sendMessage(message: '"1,0,1,"');
                      },
                      child: Text("Send Cans signal")),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        /**
                       * 2 : mean this message is from camera
                       * 0 : mean there is no plastic .
                       * 1 : mean open cans hole .
                       */
                        bl_controller.sendMessage(message: '"1,1,1,"');
                      },
                      child: Text("Send Both Plastic & Cans signal")),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bl_controller.connectToCameraBluetoothModule();
                      },
                      child: Text("Connect with aurdino"))
                ],
              );
            }),
      ),
    );
  }
}
