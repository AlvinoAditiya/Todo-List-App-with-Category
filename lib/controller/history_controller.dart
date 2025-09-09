import 'package:get/get.dart';

class HistoryController extends GetxController {
  var completedTodos = <String>[].obs;

  void addCompleted(String task) {
    completedTodos.add(task);
  }
}
