import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/splashscreen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}


