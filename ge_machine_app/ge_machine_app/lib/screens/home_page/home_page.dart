import 'package:flutter/material.dart';
import 'package:ge_machine_app/dimensions.dart';
import 'package:ge_machine_app/controllers/bluetooth_controller.dart';
import 'package:ge_machine_app/screens/home_page/home_page_components/home_page_background.dart';
import 'package:ge_machine_app/screens/home_page/home_page_components/start_button.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    /**
     * this line is used to hide upper status bar .
     */
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [
          SystemUiOverlay.bottom,
        ]); // to hide only bottom bar,
    super.initState();
  }

  int _pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: DeviceDimensions.height,
        width: DeviceDimensions.width,
        child: Stack(
          children: [HomePageBackground(), StartButton()],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
