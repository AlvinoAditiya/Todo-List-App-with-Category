import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/home_controller.dart';
import 'package:todo_list_app_with_category/controller/login_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
