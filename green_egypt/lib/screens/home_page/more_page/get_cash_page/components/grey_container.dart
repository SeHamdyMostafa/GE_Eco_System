import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class GreyContainer extends StatelessWidget {
  const GreyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.5),
          borderRadius: BorderRadius.circular(32)),
      width: Dimensions.width * .3,
      height: 8,
    );
  }
}
