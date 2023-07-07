import 'package:get/get.dart';
import 'package:store_app/data/controllers/language_controller.dart';
import 'package:store_app/data/controllers/theme_controller.dart';
import '../data/controllers/auth_controller.dart';
import '../data/controllers/store_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<ItemsController>(ItemsController());
    Get.put<ThemeController>(ThemeController());
    Get.put<LanguageController>(LanguageController());
  }
}
