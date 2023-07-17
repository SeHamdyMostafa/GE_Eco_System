import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/login_page_buttons/facebook_login_button.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/login_page_buttons/google_signin_button.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/login_page_buttons/register_and_forget_password_row.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/login_page_buttons/sign_in_button.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/login_page_header_image.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/passwordTextField/password_text_field.dart';
import 'package:green_egypt/screens/login_screen/login_page_components/userNameTextField/user_name_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Dimensions.width,
          height: Dimensions.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                /**
                   * Container that contain login apge header image
                   */
                SizedBox(
                  height: Dimensions.height * .02,
                ),
                LoginPageHeaderImage(),

                /**
                   * Contaienr that hold 2TF and login button
                   */
                Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      /**
                         * Login Now Text
                         */
                      SizedBox(
                        height: Dimensions.height * .02,
                      ),
                      Text(
                        "Login Now".tr,
                        style: TextStyle(
                            fontSize: Dimensions.width * .06,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                          height: Dimensions.height * .02),
                      /**
                                 * Description Text
                                 */
                      Text(
                        "Please enter the details below to continue.".tr,
                        style: TextStyle(
                            fontSize: Dimensions.width * .035,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: Dimensions.height * 0.01,
                      ),
                      SizedBox(
                        height: Dimensions.height * .01,
                      ),
                      /***
                         * User Name Text Field
                         */
                      UserNameTextField(
                          userNameTextEditingController:
                              userNameTextEditingController),
                      /**
                                 * Password Text Field
                                 */
                      SizedBox(
                        height: Dimensions.height * .02,
                      ),
                      PasswordTextField(
                          passwordTextEditingController:
                              passwordTextEditingController),
                      RegisterAndForgetPasswordRow(),
                      Container(
                        width: Dimensions.width * .8,
                        child: Column(
                          children: [
                            /**
                               * login Anonymous
                               */

                            SignInButton(
                              emailController: userNameTextEditingController,
                              passwordController: passwordTextEditingController,
                              loginKey: loginKey,
                            ),
                            SizedBox(
                              height: Dimensions.width * .03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: Dimensions.width * .3,
                                    color: Colors.grey[300],
                                    height: 2),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("or".tr),
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                    width: Dimensions.width * .3,
                                    color: Colors.grey[300],
                                    height: 2),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.width * .03,
                            ),
                            /**
                               * Signin with Google button
                               */
                            GoogleSignInButton(),
                            SizedBox(
                              height: Dimensions.width * .03,
                            ),
                            /**
                               * Signin with Facebook
                               */
                            FacebookSignInButton(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
