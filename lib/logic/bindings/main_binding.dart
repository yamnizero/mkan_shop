import 'package:get/instance_manager.dart';
import 'package:mkan_shop/logic/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}