import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/dimensions.dart';

class CallUsOption extends StatelessWidget {
  const CallUsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // will add any number as we need
        String phoneNumber = '+201096482183';

        final Uri params = Uri(
          scheme: 'tel',
          path: "phoneNumber",
        );

// Launch the URL with the phone number parameter.
        await launch(params.toString());
      },
      child: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'assets/images/call.png',
                    height: Dimensions.height*0.047,
                  ),
                ),
                Text('Call Us'.tr,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xfffec569),
                    )),
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
