import 'package:get/get.dart';

class EditController extends GetxController {
  var currentTask = ''.obs;

  void updateTask(String newTask) {
    currentTask.value = newTask;
  }
}
