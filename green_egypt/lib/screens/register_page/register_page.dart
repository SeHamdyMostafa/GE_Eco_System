import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/register_page/register_page_controller.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/email_text_field.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/first_name_text_field.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/last_name_text_field.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/page_header.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/password_text_field.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/sign_up_button.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/user_category_options.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/user_number_TF.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final signUpPageController =
      Get.put(RegisterPageController(), permanent: true);

  GlobalKey<FormState> sigUpFormState = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController userNumberController = TextEditingController();

  int _groupValue = 0;

  String userCategory = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Dimensions.width,
          height: Dimensions.height,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                /**
                 * main Column
                 */
                child: GetBuilder<RegisterPageController>(
                    init: RegisterPageController(),
                    builder: (controller) {
                      return Form(
                        autovalidateMode: controller.validationMode,
                        key: sigUpFormState,
                        child: Container(
                          width: Dimensions.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                DefaultColors.defaultGreen)),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_sharp,
                                      color: DefaultColors.defaultGreen,
                                      size: 28,
                                    ),
                                  ),
                                ],
                              ),
                              /**
                         * Page Header Widget
                         */
                              PageHeader(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /**
                             * First Name TF Column
                             */
                                  FirstNameTF(
                                      firstNameController: firstNameController),
                                  /**
                             * Last Name TF Column
                             */
                                  LastNameTF(
                                      lastNameController: lastNameController),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              Text("Email".tr),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              /**
                         * Email TF
                         */
                              EmailTF(emailController: emailController),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              /**
                                 * Password TF
                                 */

                              Text("Password".tr),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              PasswordTF(
                                  passwordController: passwordController,
                                  signUpPageController: signUpPageController),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              Text("Mobile Number".tr),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              UserNumberTF(
                                  userNumberController: userNumberController,
                                  signUpPageController: signUpPageController),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              // TODO add user category to user model
                              UserCategoryOptions(groupValue: _groupValue),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              SignUpButton(
                                userCredintial: controller.userCredintial,
                                sigUpFormState: sigUpFormState,
                                emailController: emailController,
                                passwordController: passwordController,
                                firstNameController: firstNameController,
                                lastNameController: lastNameController,
                                userNumberController: userNumberController,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
