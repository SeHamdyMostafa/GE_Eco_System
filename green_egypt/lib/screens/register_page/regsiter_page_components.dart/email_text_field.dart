import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class EmailTF extends StatelessWidget {
  const EmailTF({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        validator: (value) {
          if (value == "" || value == null) {
            return "You can't leave email empty".tr;
          } else if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value) ==
              false) {
            return "This is not an email !!".tr;
          }
        },
        controller: emailController,
        decoration: InputDecoration(
            prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: FaIcon(FontAwesomeIcons.user)),
            hintText: "enter your email".tr,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            )),
      ),
    );
  }
}

