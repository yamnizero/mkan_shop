import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/utils/theme.dart';
import 'package:mkan_shop/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;


  const ContainerUnder({required this.text,required this.onPressed,required this.textType, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration:  BoxDecoration(
        color:  Get.isDarkMode ?   pinkClr : mainColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            underline: TextDecoration.none,
          ),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
            text: textType,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            underline: TextDecoration.underline,
          ), ),
        ],
      ),
    );
  }
}
