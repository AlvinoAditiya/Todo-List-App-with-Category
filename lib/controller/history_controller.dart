import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/Helper/dbHelper.dart';
import 'package:todo_list_app_with_category/widgets/custom_button.dart';
import 'package:todo_list_app_with_category/widgets/custom_textfield.dart';

class HistoryController extends GetxController {
  final DBHelper dbHelper = DBHelper();
  final RxList<Map<String, dynamic>> historyList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadHistory();
  }

  Future<void> loadHistory() async {
    final todos = await dbHelper.getTodos();
    historyList.assignAll(todos.where((t) => t['isDone'] == 1));
  }

  Future<void> addHistory(Map<String, dynamic> todo) async {
    await dbHelper.updateTodo(todo['id'], {...todo, 'isDone': 1});
    await loadHistory();
  }

  Future<void> deleteHistoryAt(int index) async {
    if (index < 0 || index >= historyList.length) return;

    final todo = historyList[index];
    await dbHelper.deleteTodo(todo['id']);
    await loadHistory();
  }

  Future<void> clearHistory() async {
    final todos = await dbHelper.getTodos();
    for (final todo in todos.where((t) => t['isDone'] == 1)) {
      await dbHelper.deleteTodo(todo['id']);
    }
    await loadHistory();
  }

  Future<void> updateTodoDialog(int index) async {
     if (index < 0 || index >= historyList.length) return;

    final todo = historyList[index];
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
                .map((cat) => DropdownMenuItem(
                      value: cat,
                      child: Text(cat),
                    ))
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
          await loadHistory();
          Get.back();
        },
      ),
    );
  }
}