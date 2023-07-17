import 'package:flutter/material.dart';
import 'package:ge_machine_app/dimensions.dart';

class DetailsAboveQrcode extends StatelessWidget {
  const DetailsAboveQrcode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: DeviceDimensions.height * .06,
        ),
        Row(
          children: [
            Container(
                height: DeviceDimensions.width * .05,
                child: Image.asset('assets/GE Logo.png')),
            const SizedBox(
              width: 12,
            ),
            const Text(
              "Green Egypt",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        SizedBox(
          height: DeviceDimensions.height * .03,
        ),
        Text(
          "Scan & Earn",
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "With these simple steps , you can earn your points : ",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "1. open Green Egypt Application.",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "2. Navigate to Qrcode page and touch \nupper square to open camera.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "3.Scan this qrcode",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
