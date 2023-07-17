import 'package:flutter/material.dart';
import 'package:ge_machine_app/dimensions.dart';

class HomePageBackground extends StatelessWidget {
  HomePageBackground({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceDimensions.width,
      height: DeviceDimensions.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/main_page_background.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }
}
