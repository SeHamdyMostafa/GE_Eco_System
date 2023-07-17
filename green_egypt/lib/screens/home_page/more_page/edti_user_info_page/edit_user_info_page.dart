import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:green_egypt/services/firebase_services/firebase_services.dart';
import 'package:lottie/lottie.dart';

class EditUserInfoPage extends StatelessWidget {
  EditUserInfoPage({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _tf_userName = TextEditingController();
  TextEditingController _tf_phoneNumber = TextEditingController();
  String initialeUserName = UserDataBox.instance.get_userName();
  String initialPhoneNumber = UserDataBox.instance.get_phoneNumber();
  @override
  Widget build(BuildContext context) {
    _tf_userName.text = initialeUserName;
    _tf_phoneNumber.text = initialPhoneNumber;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit your Profile'.tr),
      ),
      body: Form(
        child: Form(
          key: _formKey,
          child: Container(
            width: Dimensions.width,
            height: Dimensions.height,
            child: SingleChildScrollView(
              child: GetBuilder<ApplicationThemeController>(
                  builder: (themeController) {
                return Column(
                  children: [
                    Lottie.asset("assets/animated_vectors/edit_animation.json"),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('User Name :'.tr),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            style: TextStyle(
                                color: themeController.isDark
                                    ? Colors.white
                                    : Colors.black),
                            controller: _tf_userName,
                            decoration: InputDecoration(
                              hintText: 'user name'.tr,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text('Phone Number :'.tr),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            style: TextStyle(
                                color: themeController.isDark
                                    ? Colors.white
                                    : Colors.black),
                            controller: _tf_phoneNumber,
                            decoration: InputDecoration(
                              hintText: 'phone number'.tr,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: OutlinedButton(
                                onPressed: () {
                                  if (initialeUserName == _tf_userName.text &&
                                      initialPhoneNumber == _tf_phoneNumber) {
                                    // this mean user not changes any thing , so only move back .
                                  } else if (initialeUserName !=
                                      _tf_userName.text) {
                                    FirebaseCustomServices.instance
                                        .updateUserName(
                                            context: context,
                                            newName: _tf_userName.text);
                                  } else if (initialPhoneNumber !=
                                      _tf_phoneNumber.text) {
                                    FirebaseCustomServices.instance
                                        .updatePhoneNumber(
                                            context: context,
                                            phoneNumber: _tf_phoneNumber.text);
                                  }
                                  Get.back();
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Apply Changes'.tr),
                                    Icon(Icons.done_all)
                                  ],
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
