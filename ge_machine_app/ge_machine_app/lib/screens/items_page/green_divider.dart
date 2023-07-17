import 'package:flutter/material.dart';
import 'package:ge_machine_app/dimensions.dart';

class GreenDivider extends StatelessWidget {
  const GreenDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      width: 2,
      height: DeviceDimensions.height * .12,
      color: Colors.green,
    );
  }
}
