import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/logic/controllers/auth_controller.dart';
import 'package:mkan_shop/routes/routes.dart';
import 'package:mkan_shop/utils/my_string.dart';
import 'package:mkan_shop/utils/theme.dart';
import 'package:mkan_shop/view/widgets/text_utils.dart';

import '../../widgets/auth/auth_text_from_field.dart';
import '../../widgets/auth/check_widget.dart';
import 'auth_button.dart';
import 'container_under.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ?  darkGreyClr: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1.28,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                text: 'SIGN',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ?   pinkClr : mainColor,
                                underline: TextDecoration.none),
                            const SizedBox(width: 3,),
                            TextUtils(
                                text: 'UP',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? Colors.white : Colors
                                    .black,
                                underline: TextDecoration.none),

                          ],
                        ),
                        const SizedBox(height: 50,),
                        AuthTextFromField(
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            print('errrrrrrrrr');
                            if (value
                                .toString()
                                .length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode ?
                          Image.asset('assets/images/user.png',color: Get.isDarkMode ?   pinkClr : mainColor)
                              :  Icon(
                            Icons.person, color: Get.isDarkMode ?   pinkClr : mainColor, size: 30,)
                          ,
                          suffixIcon: const Text(''),
                          hintText: 'User Name',
                        ),
                        const SizedBox(height: 20,),
                        AuthTextFromField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode ? Image.asset(
                              'assets/images/email.png',color: Get.isDarkMode ?   pinkClr : mainColor) :  Icon(
                            Icons.email, color: Get.isDarkMode ?   pinkClr : mainColor, size: 30,),
                          suffixIcon: const Text(''),
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20,),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFromField(
                            controller: passwordController,
                            obscureText: controller.isVisibility ? false : true,
                            validator: (value) {
                              if (value
                                  .toString()
                                  .length < 6) {
                                return 'Password should be longer or equal to 6 characters ';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode ? Image.asset(
                                'assets/images/lock.png',color: Get.isDarkMode ?   pinkClr : mainColor) :  Icon(
                              Icons.lock, color: Get.isDarkMode ?   pinkClr : mainColor, size: 30,),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ?
                              const Icon(
                                Icons.visibility_off, color: Colors.black,)
                                  : const Icon(
                                Icons.visibility, color: Colors.black,),
                            ),
                            hintText: 'Password',
                          );
                        }),
                        const SizedBox(height: 50,),
                        CheckWidget(),
                        const SizedBox(height: 50,),
                        GetBuilder<AuthController>(builder: (_){
                          return AuthButton(
                            text: "SIGN UP",
                            onPressed: () {
                              if(controller.isCheckBox == false ){
                                  Get.snackbar('Check Box', 'Please, Accept terms & conditions',
                                   snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.amber,
                                    colorText: Colors.black,
                                  );
                              } else if(fromKey.currentState!.validate()){
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.signUpUsingFirebase(
                                    name: name,
                                    email: email,
                                    password: password,
                                );
                                controller.isCheckBox = true;
                              }
                            },
                          );
                        },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already have an Account? ',
                textType: "Login",
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
