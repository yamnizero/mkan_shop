import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/logic/controllers/cart_controller.dart';
import 'package:mkan_shop/utils/theme.dart';
import 'package:mkan_shop/view/widgets/cart/cart_product_card.dart';

import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProduct();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx(
          () {
            if (controller.productsMap.isEmpty) {
              return const EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 630,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            productModels:
                                controller.productsMap.keys.toList()[index],
                            index: index,
                            quantity:
                                controller.productsMap.values.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.productsMap.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
