import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstNameTF extends StatelessWidget {
  const FirstNameTF({
    Key? key,
    required this.firstNameController,
  }) : super(key: key);

  final TextEditingController firstNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "First Name".tr,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .425,
          child: TextFormField(
            validator: (value) {
              if (value == "" || value == null) {
                return "You can't leave it empty".tr;
              }
            },
            controller: firstNameController,
            decoration: InputDecoration(
                hintText: "enter first name".tr,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
          ),
        )
      ],
    );
  }
}
