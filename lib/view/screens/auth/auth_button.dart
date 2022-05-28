import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/utils/theme.dart';
import 'package:mkan_shop/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({required this.text,
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary:  Get.isDarkMode ?   pinkClr : mainColor,
        minimumSize: const Size(360, 50),
      ),
      onPressed: onPressed,
        child: TextUtils(
          color: Colors.white,
          text: text,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          underline: TextDecoration.none,
        ),
    );
  }
}
