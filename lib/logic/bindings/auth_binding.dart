import 'package:get/instance_manager.dart';
import 'package:mkan_shop/logic/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}