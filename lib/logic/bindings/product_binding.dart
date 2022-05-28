
import 'package:get/instance_manager.dart';
import 'package:mkan_shop/logic/controllers/cart_controller.dart';
import 'package:mkan_shop/logic/controllers/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
  }
}