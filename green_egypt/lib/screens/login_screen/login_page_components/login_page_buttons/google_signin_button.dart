import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:green_egypt/services/firebase_services/firebase_services.dart';
import 'package:green_egypt/services/firebase_services/google_auth.dart';

class GoogleSignInButton extends StatelessWidget {
  /**
   * Google Sign in button is running with these Steps :
   * 1- Try logging with Google Account 
   * if accepted .. store user data in UserInfo and store logged in UserLoggedController
   * else .. show error in Toast
   */
  const GoogleSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * Google SIgn in Button
     */
    return ElevatedButton(
      /**
       * Button Styling
       */
      style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      /**
           * on pressed
           */
      onPressed: () async {
        await GoogleCustomAuth.signInWithGoogle(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .1,
            ),
            Image(
              width: MediaQuery.of(context).size.width * .06,
              height: MediaQuery.of(context).size.height * .04,
              image: AssetImage("assets/icons/google.png"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .03,
            ),
            Text(
              "Sign with Google".tr,
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
