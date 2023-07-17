import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:green_egypt/services/firebase_services/firebase_services.dart';
import 'package:lottie/lottie.dart';

class SignInButton extends StatelessWidget {
  TextEditingController emailController;
  GlobalKey<FormState> loginKey;
  TextEditingController passwordController;

  SignInButton(
      {required this.emailController,
      required this.passwordController,
      required this.loginKey});
  @override
  Widget build(BuildContext context) {
    /**
     * Sign in Button
     */
    return ElevatedButton(
      /**
       * Button Styling
       */
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
      ),
      /**
       * Button Action
       */
      onPressed: () async {
        if (loginKey.currentState!.validate()) {
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
                 * Sign in with email and password 
                 */
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text)
                .then((value) async {
              FirebaseCustomServices.instance
                  .signInUser_withEmailAndPassword_thenStoreDataLocally(
                      emailController: emailController,
                      passwordController: passwordController)
                  .then((value) {
                /**
               * Remove loading indicator
               */
                Get.back();
                /**
           * Show success animation
           */
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
                            'assets/animated_vectors/register_success.json'.tr,
                            repeat: false),
                      );
                    });
              });
            });
          } on FirebaseAuthException catch (e) {
            /**
             * Remove loading indicator
             */
            Get.back();
            if (e.code == 'user-not-found'.tr) {
              CustomToast.showRedToast(
                  messsage: 'No user found for that email.'.tr);
            } else if (e.code == 'wrong-password') {
              CustomToast.showRedToast(
                  messsage: 'Wrong password provided for that user.'.tr);
            }
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign in".tr,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
