
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/logic/controllers/auth_controller.dart';
import 'package:mkan_shop/logic/controllers/theme_controller.dart';
import 'package:mkan_shop/utils/theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){
                ThemeController().changesTheme();
              },
            child: Text('DarkMode',
            style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),),
            ),
            const SizedBox(height: 20,),
            GetBuilder<AuthController>(
              builder: (controller){
                return TextButton(

                  onPressed: (){
                    Get.defaultDialog(
                      title: "Logout From App",
                      titleStyle:   const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18
                      ),
                      middleText: 'Are you sure you need to logout',
                      middleTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18
                      ),
                      backgroundColor: Colors.grey,
                      radius: 10,
                      textCancel: " NO ",
                      cancelTextColor: Colors.white,
                      textConfirm: " YES ",
                      confirmTextColor: Colors.white,
                      onCancel: (){
                        Get.back();
                      },
                      onConfirm: (){
                        controller.signOutFromApp();
                      },
                      buttonColor:  Get.isDarkMode ? pinkClr : mainColor,
                    );

                  },
                  child: Text('LogOut',
                    style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),),
                );
              },
            ),
          ],
        )
      ),
    );
  }
}