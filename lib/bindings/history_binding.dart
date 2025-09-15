import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
