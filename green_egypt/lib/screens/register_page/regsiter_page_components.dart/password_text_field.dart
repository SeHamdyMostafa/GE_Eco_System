import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/register_page/register_page_controller.dart';

class PasswordTF extends StatelessWidget {
  const PasswordTF({
    Key? key,
    required this.passwordController,
    required this.signUpPageController,
  }) : super(key: key);

  final TextEditingController passwordController;
  final RegisterPageController signUpPageController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPageController>(builder: (controller) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          validator: (value) {
            if (value == "" || value == null) {
              return "You can't leave password empty".tr;
            } else if (value.length < 8) {
              return "Password must be 8 or more !!".tr;
            }
          },
          controller: passwordController,
          obscureText: signUpPageController.securePassword,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: signUpPageController.eyeIcon,
                  onPressed: () {
                    signUpPageController
                        .changeShowPasswordValue();
                  }),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FaIcon(FontAwesomeIcons.shieldHalved),
              ),
              hintText: "enter your password".tr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              )),
        ),
      );
    });
  }
}
