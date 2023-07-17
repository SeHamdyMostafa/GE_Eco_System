import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/dimensions.dart';

class ChatOption extends StatelessWidget {
  
  String url = "https://wa.me/201281190072?";


   ChatOption({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
      //To remove the keyboard when button is pressed
      FocusManager.instance.primaryFocus?.unfocus();
       
       List<String> parts = url.split('?');
       String phone = parts[0].replaceAll('https://wa.me/', '');
      

      var whatsappUrl = "whatsapp://send?phone=+$phone";
      await launch(whatsappUrl);
      
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
                    'assets/images/chat.png',
                    height: Dimensions.height*0.06,
                  ),
                ),
                Text(
                  'Chat'.tr,
                  style: TextStyle(fontSize: 18, color: Color(0xff800080)),
                ),  
              ],
            ),
           
            decoration: BoxDecoration(
              color: ApplicationThemeController.instance.isDark
                  ?  Colors.black 
                  :  Colors.white , 
              borderRadius: BorderRadius.circular(10), //border corner radius
             
            ),
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
    );
  }
}
