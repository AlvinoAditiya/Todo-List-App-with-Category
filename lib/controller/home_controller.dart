import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/Helper/dbHelper.dart';
import 'package:todo_list_app_with_category/controller/history_controller.dart';
import 'package:todo_list_app_with_category/widgets/custom_button.dart';
import 'package:todo_list_app_with_category/widgets/custom_textfield.dart';

class HomeController extends GetxController {

  final DBHelper dbHelper = DBHelper();

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
    loadTodos();
  }

  Future<void> loadTodos() async {
    final todos = await dbHelper.getTodos();
    todoList.assignAll(todos.where((t) => t['isDone'] == 0));
    completedList.assignAll(todos.where((t) => t['isDone'] == 1));
  }

  Future<void> addTodo(String title, String description, String category, DateTime? dueDate) async {
    if (title.isEmpty || description.isEmpty || category.isEmpty) {
      Get.snackbar("Gagal", "Semua field harus diisi!");
      return;
    }

    final newTodo = {
      'title': title,
      'description': description,
      'category': category,
      'isDone': 0,
      'dueDate': dueDate?.toIso8601String() ?? "",
    };

    await dbHelper.insertTodo(newTodo);
    await loadTodos();
  }

  Future<void> markAsDone(int index) async {
    if (index < 0 || index >= todoList.length) return;

    final todo = Map<String, dynamic>.from(todoList[index]);
    todo['isDone'] = 1;

    await dbHelper.updateTodo(todo['id'], todo);
    await loadTodos();

    historyController.addHistory(todo);
  }

  Future<void> deleteTodoAt(int index) async {
    if (index < 0 || index >= todoList.length) return;

    final todo = todoList[index];
    await dbHelper.deleteTodo(todo['id']);
    await loadTodos();
  }

  Future<void> updateTodoDialog(int index) async {
    final todo = todoList[index];
    final titleC = TextEditingController(text: todo['title']);
    final descC = TextEditingController(text: todo['description']);
    String category = todo['category'] ?? "Umum";

    Get.defaultDialog(
      title: "Edit Todo",
      content: Column(
        children: [
          CustomTextField(hint: "Judul", controller: titleC),
          const SizedBox(height: 10),
          CustomTextField(hint: "Deskripsi", controller: descC),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: category,
            items: ["Umum", "Pekerjaan", "Sekolah", "Pribadi"]
                .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                .toList(),
            onChanged: (value) {
              if (value != null) category = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ],
      ),
      textCancel: "Batal",
      confirm: CustomButton(
        text: "Simpan",
        onPressed: () async {
          final updatedTodo = {
            'title': titleC.text.trim(),
            'description': descC.text.trim(),
            'category': category,
            'isDone': todo['isDone'],
            'dueDate': todo['dueDate'],
          };

          await dbHelper.updateTodo(todo['id'], updatedTodo);
          await loadTodos();
          Get.back();
        },
      ),
    );
  }

  /// 🔹 Dialog tambah todo
  void showAddTodoDialog() {
    final titleC = TextEditingController();
    final descC = TextEditingController();
    String category = "Umum";

    Get.defaultDialog(
      title: "Tambah Todo",
      content: Column(
        children: [
          CustomTextField(hint: "Judul", controller: titleC),
          const SizedBox(height: 10),
          CustomTextField(hint: "Deskripsi", controller: descC),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: category,
            items: ["Umum", "Pekerjaan", "Sekolah", "Pribadi"]
                .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                .toList(),
            onChanged: (value) {
              if (value != null) category = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ],
      ),
      textCancel: "Batal",
      confirm: CustomButton(
        text: "Simpan",
        onPressed: () async {
          await addTodo(titleC.text.trim(), descC.text.trim(), category, DateTime.now());
          Get.back();
        },
      ),
    );
  }
}