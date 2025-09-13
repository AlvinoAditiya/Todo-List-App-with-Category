import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/history_controller.dart';

class HomeController extends GetxController {
  // List todo aktif
  final RxList<Map<String, dynamic>> todoList = <Map<String, dynamic>>[].obs;

  // List todo yang sudah selesai
  final RxList<Map<String, dynamic>> completedList = <Map<String, dynamic>>[].obs;

  // Menghubungkan ke HistoryController
  late final HistoryController historyController;

  @override
  void onInit() {
    super.onInit();
    // Pastikan HistoryController sudah diregister
    if (!Get.isRegistered<HistoryController>()) {
      Get.lazyPut<HistoryController>(() => HistoryController());
    }
    historyController = Get.find<HistoryController>();
  }

  /// Menambahkan todo baru
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

  /// Update todo yang ada
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

    // Update data
    todo['title'] = newTitle;
    todo['description'] = newDescription;
    todo['category'] = newCategory;
    todo['dueDate'] = newDueDate;
    todo['isDone'] = newIsDone;

    // Jika status selesai berubah dari false -> true
    if (newIsDone && !wasDone) {
      completedList.add(Map<String, dynamic>.from(todo));
      historyController.addHistory(Map<String, dynamic>.from(todo));
      todoList.removeAt(index);
    }

    // Jika status berubah dari true -> false
    else if (!newIsDone && wasDone) {
      historyController.deleteHistory(todo);
    }

    todoList.refresh();
    completedList.refresh();
  }

  /// Tandai todo sebagai selesai
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

  /// Hapus todo dari daftar aktif
  void deleteTodoAt(int index) {
    if (index >= 0 && index < todoList.length) {
      todoList.removeAt(index);
      todoList.refresh();
    }
  }

  /// Hapus todo dari daftar completed
  void deleteCompletedAt(int index) {
    if (index >= 0 && index < completedList.length) {
      completedList.removeAt(index);
      completedList.refresh();
    }
  }
}
