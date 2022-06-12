import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/logic/controllers/auth_controller.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Logout From App",
                    titleStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                    middleText: 'Are you sure you need to logout',
                    middleTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                    backgroundColor: Colors.grey,
                    radius: 10,
                    textCancel: " NO ",
                    cancelTextColor: Colors.white,
                    textConfirm: " YES ",
                    confirmTextColor: Colors.white,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.signOutFromApp();
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  );
                },
                splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
                borderRadius: BorderRadius.circular(22),
                customBorder: const StadiumBorder(),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: logOutSettings,
                      ),
                      child: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextUtils(
                      text: "Log Out",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underline: TextDecoration.none,
                    ),
                  ],
                ),
              ),
            ));
  }
}
