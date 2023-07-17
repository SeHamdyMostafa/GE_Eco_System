import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:green_egypt/services/firebase_services/firebase_services.dart';
import 'package:lottie/lottie.dart';

class RegisterPageController extends GetxController {
  var validationMode = AutovalidateMode.disabled;
  bool securePassword = true;
  String userCredintial = "normal_user";
  FaIcon eyeIcon = FaIcon(FontAwesomeIcons.eyeSlash);
  Color eyeIconColor = Colors.grey;

  SignUpPageController() {
    eyeIcon = FaIcon(
      FontAwesomeIcons.eyeSlash,
      color: eyeIconColor,
    );
  }

  void chageUserCredintial(String newCategory) {
    userCredintial = newCategory;
    update();
  }

  void changeShowPasswordValue() {
    securePassword = !securePassword;
    if (securePassword == true) {
      eyeIconColor = Colors.grey;
      eyeIcon = FaIcon(
        FontAwesomeIcons.eyeSlash,
        color: eyeIconColor,
      );
    } else {
      eyeIconColor = DefaultColors.defaultGreen;
      eyeIcon = FaIcon(
        FontAwesomeIcons.eye,
        color: eyeIconColor,
      );
    }

    update();
  }

  void changeValidationMode() {
    /**
     * Keep tracking user input and validate it immediatly !! 🔥🤍
     */
    validationMode = AutovalidateMode.onUserInteraction;
    update();
  }

  Future<void> registerNewUser(
      {required BuildContext context,
      required TextEditingController emailController,
      required TextEditingController passwordController,
      required String userCredintial,
      required TextEditingController firstNameController,
      required TextEditingController lastNameController,
      required TextEditingController userNumberController}) async {
    try {
      /**
       * Show loading Indicator
       */
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          });
      /**
           * Regsiter New User 
           */
      FirebaseCustomServices.instance
          .registerNewUser(
              email: emailController.text,
              password: passwordController.text,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              phoneNumber: userNumberController.text,
              credintial: userCredintial)
          .then((value) {
        /**
                     * Remove loading indicator
                     */
        Get.back();
        /**
                * Show animted success vector
                */
        // TODO : show success animation .
        showDialog(
            context: context,
            builder: (context) {
              Future.delayed(Duration(seconds: 3), () {
                /**
                        * Remove Success Animation
                        */
                Get.back();
                /**
                         * Navigate to Home Screen 
                         */
                Get.offAllNamed(PagesNames.homePage);
              });
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Lottie.asset(
                    'assets/animated_vectors/register_done_animation.json',
                    repeat: false),
              );
            });
      });
    } on FirebaseAuthException catch (e) {
      
    }
  }
}
