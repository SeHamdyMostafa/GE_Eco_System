import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/passwordTextField/password_tf_controller.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/userNameTextField/user_name_tf_controller.dart';

class UserNameTextField extends StatelessWidget {
  UserNameTextField({
    Key? key,
    required this.userNameTextEditingController,
  }) : super(key: key);

  final TextEditingController userNameTextEditingController;
  UserNameTFController userNameController = Get.put(UserNameTFController());
  PasswordTFController passowrdController = Get.put(PasswordTFController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserNameTFController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        width: MediaQuery.of(context).size.width,
        /**
             * User Name Text Field
             */
        child: TextFormField(
          validator: ((value) {
            if (value!.isEmpty) {
              return "you can't leave user name field empty !!".tr;
            } else if (!value.isEmail) {
              return "this is not email !!".tr;
            }
          }),
          style: Theme.of(context).textTheme.subtitle1,
          controller: userNameTextEditingController,
          onEditingComplete: () {
            controller.changeLabelColorToLeave();
          },
          onTap: () {
            controller.changeLabelColorToFocus();
            passowrdController.changeLabelColorToLeave();
          },
          cursorColor: Colors.green,
          decoration: InputDecoration(
            prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: FaIcon(
                  FontAwesomeIcons.user,
                  color: userNameController.labelColor,
                )),
            labelText: "Email".tr,
            labelStyle: TextStyle(color: controller.labelColor),
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
