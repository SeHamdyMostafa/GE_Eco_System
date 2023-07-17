import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/dimensions.dart';
import '../../../../config/theme/application_theme_controller_box.dart';


class Container_model extends StatefulWidget {
  Container_model({required this.content, required this.Height});
  late String content;
  late double Height;

  @override
  State<Container_model> createState() => _Container_modelState();
}

class _Container_modelState extends State<Container_model> {
  double containerHieght = 0;

  @override
  void initState() {
    Timer(
      Duration(milliseconds: 250),
      () {
        containerHieght = widget.Height;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      /************************ Stack For Two Container Model ************************/
      children: [
        Stack(children: [
          Container(
            width: Dimensions.width * 0.04,
            height: Dimensions.height * 0.23,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF6cb0ed)),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: Dimensions.width * 0.04,
              height: containerHieght,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFF2d5da9)),
            ),
          ),
        ]),
        SizedBox(
          height: 12,
        ),
        
        /************************ Text Of Container Model ************************/
        Text(widget.content,
            style: TextStyle(
              fontSize: 18,
              color: ApplicationThemeController.instance.isDark
                  ? Color(0xfff7f5f5)
                  : Colors.black ,  
            )),
        SizedBox(
          height: 12,
        )
      ],
    );
  }
}
