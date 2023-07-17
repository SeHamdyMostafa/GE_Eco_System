
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/start_screen/components/start_screen_login_button.dart';
import 'package:green_egypt/screens/start_screen/components/start_screen_register_button.dart';
import 'package:lottie/lottie.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Dimensions.width,
        height: Dimensions.height,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/animated_vectors/hello.json', width: 350),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "We are happy to see you in Green Egypt".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 48,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Don't have an Account !".tr,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                /**
                 * Regsiter button
                 */
                StartScreenRegisterButton(),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Already have an Account !".tr,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                /**
                 * Login button
                 */
                StartScreenLoginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
