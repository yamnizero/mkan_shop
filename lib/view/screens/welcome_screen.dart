import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/routes/routes.dart';
import 'package:mkan_shop/utils/theme.dart';
import 'package:mkan_shop/view/screens/auth/login_screen.dart';
import 'package:mkan_shop/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextUtils(
                        text: 'Welcome',
                        fontSize: 35,
                        underline: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                            text: "Mkan",
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            underline: TextDecoration.none,
                            color: mainColor),
                        const SizedBox(
                          width: 7,
                        ),
                        TextUtils(
                            text: "Shop",
                            fontSize: 35,
                            underline: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                      ),
                      onPressed: () {
                        Get.offNamed(Routes.loginScreen);
                      },
                      child: TextUtils(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        text: 'Get Start',
                        color: Colors.white,
                        underline: TextDecoration.none,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          text: "Don't have an Account?",
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                      TextButton(onPressed: (){
                        Get.offNamed(Routes.signUpScreen);
                      }, child: TextUtils(
                        text: 'SignUp',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        underline: TextDecoration.underline,
                      ),),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
