import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/register_page/register_page_controller.dart';
import 'package:green_egypt/services/custom_toast.dart';

class UserCategoryOptions extends StatelessWidget {
  int groupValue;
  final registerPageController = Get.put(RegisterPageController());
  UserCategoryOptions({required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: ((context, setState) {
        return Row(
          children: [
            Text("Regsiter as :  ".tr),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all<Color>(Colors.green),
                  value: 0,
                  groupValue: groupValue,
                  onChanged: ((value) {
                    setState(() {
                      value == 0
                          ? registerPageController.userCredintial =
                              "normal_user"
                          : "staff";
                      CustomToast.showGreenToast(
                          messsage:
                              "choosen Credintial : ${registerPageController.userCredintial}");
                      groupValue = value!;
                    });
                  }),
                ),
                Text("Default User".tr)
              ],
            ),
            SizedBox(
              width: Dimensions.width * .03,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all<Color>(Colors.green),
                  value: 1,
                  groupValue: groupValue,
                  onChanged: ((value) {
                    setState(() {
                      value == 1
                          ? registerPageController.userCredintial = "staff"
                          : "normal_user";
                      CustomToast.showGreenToast(
                          messsage:
                              "choosen Credintial : ${registerPageController.userCredintial}");
                      groupValue = value!;
                    });
                  }),
                ),
                Text("Staff".tr)
              ],
            ),
          ],
        );
      }),
    );
  }
}
