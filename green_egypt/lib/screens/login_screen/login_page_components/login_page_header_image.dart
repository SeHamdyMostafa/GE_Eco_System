import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/header_image.dart';

class LoginPageHeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .28,
      child: Stack(
        children: [
          HeaderImageLoginPage(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.green,
                  size: 28,
                )),
          )
        ],
      ),
    );
  }
}
