import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/history_controller.dart';

class HomeController extends GetxController {
  
  final RxList<Map<String, dynamic>> todoList = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> completedList = <Map<String, dynamic>>[].obs;

  
  late final HistoryController historyController;

  @override
  void onInit() {
    super.onInit();
    if (!Get.isRegistered<HistoryController>()) {
      Get.lazyPut<HistoryController>(() => HistoryController());
    }
    historyController = Get.find<HistoryController>();
  }

  void addTodo(String title, String description, String category, DateTime? dueDate) {
    if (title.isEmpty || description.isEmpty || category.isEmpty) {
      Get.snackbar("Gagal", "Semua field harus diisi!");
      return;
    }

    final newTodo = {
      'title': title,
      'description': description,
      'category': category,
      'isDone': false,
      'dueDate': dueDate,
    };

    todoList.add(newTodo);
    todoList.refresh();
  }

  void updateList(
    int index,
    String newTitle,
    String newDescription,
    bool newIsDone,
    String newCategory,
    DateTime? newDueDate,
  ) {
    if (index < 0 || index >= todoList.length) return;

    final todo = todoList[index];
    final bool wasDone = todo['isDone'] ?? false;

    todo['title'] = newTitle;
    todo['description'] = newDescription;
    todo['category'] = newCategory;
    todo['dueDate'] = newDueDate;
    todo['isDone'] = newIsDone;

    if (newIsDone && !wasDone) {
      completedList.add(Map<String, dynamic>.from(todo));
      historyController.addHistory(Map<String, dynamic>.from(todo));
      todoList.removeAt(index);
    }

    else if (!newIsDone && wasDone) {
      historyController.deleteHistory(todo);
    }

    todoList.refresh();
    completedList.refresh();
  }

  void markAsDone(int index) {
    if (index < 0 || index >= todoList.length) return;

    final todo = Map<String, dynamic>.from(todoList[index]);
    todo['isDone'] = true;

    completedList.add(todo);
    historyController.addHistory(todo);

    todoList.removeAt(index);
    todoList.refresh();
    completedList.refresh();
  }

  void deleteTodoAt(int index) {
    if (index >= 0 && index < todoList.length) {
      todoList.removeAt(index);
      todoList.refresh();
    }
  }

  void deleteCompletedAt(int index) {
    if (index >= 0 && index < completedList.length) {
      completedList.removeAt(index);
      completedList.refresh();
    }
  }
}
