import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/model/product_models.dart';
import 'package:mkan_shop/routes/routes.dart';

import '../../utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;


  // var total;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductFormCArt(ProductModels productModels) {
    if(productsMap.containsKey(productModels) && productsMap[productModels] == 1){
      productsMap.removeWhere((key, value) => key == productModels);
    }else{
      productsMap[productModels] -=1;
    }

  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProduct() {
    Get.defaultDialog(
      title: "Clear Products",
      titleStyle:   const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 18
      ),
      middleText: 'Are you sure you need clear products?',
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
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: (){
        productsMap.clear();
        Get.back();
      },
      buttonColor:  Get.isDarkMode ? pinkClr : mainColor,
    );

  }

  get productSubTotal => productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total =>productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element).toStringAsFixed(2);


  int quantity (){
    if(productsMap.isEmpty){
      return 0;
    }else{
      return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value + element);

    }
  }
}
