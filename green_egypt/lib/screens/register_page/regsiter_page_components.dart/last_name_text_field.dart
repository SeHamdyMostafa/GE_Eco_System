import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastNameTF extends StatelessWidget {
  const LastNameTF({
    Key? key,
    required this.lastNameController,
  }) : super(key: key);

  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Name".tr,
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
                return "You can't leave it empty";
              }
            },
            controller: lastNameController,
            decoration: InputDecoration(
                hintText: "enter last name".tr,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
          ),
        )
      ],
    );
  }
}

