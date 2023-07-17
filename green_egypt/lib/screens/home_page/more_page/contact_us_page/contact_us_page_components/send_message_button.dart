import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff2cda86)),
            minimumSize: MaterialStateProperty.all(const Size(130, 40)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Send'.tr, style: TextStyle(fontSize: 18)),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward,
                size: 22.0,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
