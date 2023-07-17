import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/dimensions.dart';

class EmailUsOption extends StatelessWidget {
  const EmailUsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // will be
        String email = 'mohamadamgado9@gmail.com';
        String subject = 'User message';
        // body is the message that will be getted form message TF .
        String body =
            'Hi there, This message is Auto created by AMG , you can Edit it as you want .';
        final Uri params = Uri(
          scheme: 'mailto',
          path: email,
          query: 'subject=$subject&body=$body',
        );
        await launch(params.toString());
      },
      child: Column(
        children: [
          SizedBox(
            width: 15,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/email.png',
                    height: Dimensions.height*0.06,
                  ),
                ),
                Text('Email Us'.tr,
                    style: TextStyle(fontSize: 18, color: Color(0xff86c447))),
              ],
            ),
          
            decoration: BoxDecoration(
            color: ApplicationThemeController.instance.isDark
                  ?  Colors.black 
                  :  Colors.white , 
              borderRadius: BorderRadius.circular(10), //border corner radius
              
            ),
          ),
        ],
      ),
    );
  }
}
