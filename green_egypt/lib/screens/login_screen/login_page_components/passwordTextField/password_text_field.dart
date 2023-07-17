import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/passwordTextField/password_tf_controller.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/userNameTextField/user_name_tf_controller.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({
    Key? key,
    required this.passwordTextEditingController,
  }) : super(key: key);

  UserNameTFController userNameController = Get.put(UserNameTFController());
  PasswordTFController passowrdController = Get.put(PasswordTFController());
  final TextEditingController passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordTFController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        width: MediaQuery.of(context).size.width,

        /**
             * Password Text Field
             */
        child: TextFormField(
          validator: (value) {
            if (value == "" || value == null) {
              return "You can't leave password empty".tr;
            } else if (value.length < 8) {
              return "Password must be 8 or more !!".tr;
            }
          },
          style: Theme.of(context).textTheme.subtitle1,
          controller: passwordTextEditingController,
          onEditingComplete: () {
            print("onEditingComplete Called".tr);
            controller.changeLabelColorToLeave();
          },
          onTap: () {
            controller.changeLabelColorToFocus();
            userNameController.changeLabelColorToLeave();
          },
          obscureText: true,
          cursorColor: Colors.green,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.all(16),
              child: FaIcon(FontAwesomeIcons.shieldHalved,
                  color: controller.pLabelColor),
            ),
            labelText: "Password".tr,
            labelStyle: TextStyle(color: controller.pLabelColor),
            focusColor: Colors.green,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.green),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    });
  }
}
