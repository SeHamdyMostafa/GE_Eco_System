import 'package:flutter/material.dart';
import 'package:ge_machine_app/dimensions.dart';

class DidYouFinishedRow extends StatelessWidget {
  const DidYouFinishedRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 2,
          width: DeviceDimensions.width * .075,
          color: Colors.green,
        ),
        SizedBox(
          width: 24,
        ),
        Text(
          "did you finished ?",
          style: TextStyle(fontSize: 18, color: Colors.green),
        ),
        SizedBox(
          width: 24,
        ),
        Container(
          height: 2,
          width: DeviceDimensions.width * .075,
          color: Colors.green,
        ),
      ],
    );
  }
}
