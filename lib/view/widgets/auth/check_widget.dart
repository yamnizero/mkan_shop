import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/utils/theme.dart';
import 'package:mkan_shop/view/widgets/text_utils.dart';

import '../../../logic/controllers/auth_controller.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return  Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                  ? Image.asset('assets/images/check.png',)
                  : Icon(Icons.done,color: Get.isDarkMode ?   pinkClr : mainColor,size: 30,)
                  :Container() ,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(

            children: [
              TextUtils(
                text: "I accept ",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color:Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              TextUtils(
                text: "terms & condition",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.underline,
              ),
            ],
          )
        ],
      );
    });
  }
}
