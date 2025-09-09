import 'package:get/get.dart';

class HomeController extends GetxController {
  var todos = <String>[].obs;

  void addTodoItem(String task) {
    todos.add(task);
  }

  void removeTodoItem(int index) {
    todos.removeAt(index);
  }
}
