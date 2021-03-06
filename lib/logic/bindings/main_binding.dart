import 'package:get/instance_manager.dart';
import 'package:mkan_shop/logic/controllers/main_controller.dart';
import 'package:mkan_shop/logic/controllers/payment_controller.dart';
import 'package:mkan_shop/logic/controllers/setting_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PaymentController(),permanent: true);
  }
}