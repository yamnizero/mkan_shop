import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/logic/controllers/setting_controller.dart';
import 'package:mkan_shop/utils/theme.dart';
import 'package:mkan_shop/view/widgets/text_utils.dart';

import '../../../logic/controllers/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
   DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Row (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),
        Switch(
          activeTrackColor: Get.isDarkMode ? pinkClr :  mainColor,
          activeColor:  Get.isDarkMode ? pinkClr :  mainColor,
          value: controller.switchValue.value,
          onChanged: (value){
            ThemeController().changesTheme();
            controller.switchValue.value = value;
          },
        ),

      ],
    ));
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            text: "Dark Mode",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underline: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
