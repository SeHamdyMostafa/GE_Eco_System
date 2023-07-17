import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrDividerLine extends StatelessWidget {
  const OrDividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 45.0, right: 10.0),
            child: Divider(
              thickness: 1,
              color: Color.fromARGB(255, 142, 140, 140),
            )),
      ),
      Text('OR'.tr),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 45.0),
            child: Divider(
              thickness: 1,
              color: Color.fromARGB(255, 142, 140, 140),
            )),
      ),
    ]);
  }
}
