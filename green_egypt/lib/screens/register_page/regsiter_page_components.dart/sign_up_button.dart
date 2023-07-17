import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/screens/register_page/register_page_controller.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:lottie/lottie.dart';

class SignUpButton extends StatelessWidget {
  final registerPageController = Get.put(RegisterPageController());
  SignUpButton(
      {Key? key,
      required this.sigUpFormState,
      required this.emailController,
      required this.passwordController,
      required this.firstNameController,
      required this.lastNameController,
      required this.userNumberController,
      required this.userCredintial})
      : super(key: key);

  final GlobalKey<FormState> sigUpFormState;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController userNumberController;
  final String userCredintial;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Register now".tr),
            SizedBox(
              width: 10,
            ),
            FaIcon(
              FontAwesomeIcons.arrowRight,
              size: 16,
            )
          ],
        ),
        onPressed: () async {
          if (sigUpFormState.currentState!.validate() && userCredintial != "") {
            await registerPageController.registerNewUser(
                userCredintial: userCredintial,
                context: context,
                emailController: emailController,
                passwordController: passwordController,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                userNumberController: userNumberController);
          } else {
            CustomToast.showBlackToast(
                messsage:
                    "user credintial = ${registerPageController.userCredintial}".tr);
            CustomToast.showRedToast(messsage: "error in validation".tr);
          }
        },
      ),
    );
  }
}
