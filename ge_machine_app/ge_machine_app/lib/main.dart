import 'package:flutter/material.dart';
import 'package:ge_machine_app/controllers/bluetooth_controller.dart';
import 'package:ge_machine_app/dimensions.dart';
import 'package:get/get.dart';
import 'package:ge_machine_app/screens/home_page/home_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter().then((value) =>  runApp(GEMachineApp()));
 
  
}

class GEMachineApp extends StatelessWidget {
  GEMachineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GE Machine App",
      debugShowCheckedModeBanner: false,
      home: GetBuilder<BluetoothController>(
          init: BluetoothController(),
          builder: (controller) {
            Get.put(BluetoothController(), permanent: true);
            return HomePage();
          }),
    );
  }
}

class CustomSplachScreen extends StatelessWidget {
  const CustomSplachScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: DeviceDimensions.height,
      width: DeviceDimensions.width,
      child: AnimatedSplashScreen(
          splashIconSize: double.infinity,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.recycling_rounded,
                size: 148,
                color: Colors.green,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Green Egypt",
                style: TextStyle(fontSize: 64, fontWeight: FontWeight.w500),
              )
            ],
          ),
          duration: 750,
          nextScreen: GetBuilder<BluetoothController>(
              init: BluetoothController(),
              builder: (controller) {
                Get.put(BluetoothController(), permanent: true);
                return HomePage();
              })),
    ));
  }
}
