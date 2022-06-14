import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/view/widgets/text_utils.dart';

import '../../utils/theme.dart';
import '../widgets/payment/delivery_continer_widget.dart';
import '../widgets/payment/payment_method_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: "Shipping to",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(
                height: 20,
              ),
              const DeliveryContainerWidget(),
              const SizedBox(
                height: 20,
              ),
              TextUtils(
                text: "Payment method",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(
                height: 20,
              ),
              PaymentMethodWidget(),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: TextUtils(
                  text: "Total: \$200",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:Get.isDarkMode? Colors.white : Colors.black,
                  underline: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0.0,
                      primary:Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    onPressed: (){},
                    child: Text("Pay Now",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
