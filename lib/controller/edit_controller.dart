import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/home_controller.dart';

class EditController extends GetxController {
  late TextEditingController titleC;
  late TextEditingController descC;
  late String category;
  DateTime? dueDate;
  late int index;

  final HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    titleC = TextEditingController();
    descC = TextEditingController();
    category = '';
  }

  /// Mengisi data awal saat user membuka halaman edit
  void setTodoData(int idx) {
    index = idx;

    if (index < 0 || index >= homeController.todoList.length) {
      Get.snackbar("Error", "Todo tidak ditemukan!");
      return;
    }

    final todo = homeController.todoList[index];
    titleC.text = todo['title'] ?? '';
    descC.text = todo['description'] ?? '';
    category = todo['category'] ?? '';
    dueDate = todo['dueDate'];
  }

  /// Update todo yang dipilih
  void updateTodo() {
    if (titleC.text.isEmpty || descC.text.isEmpty || category.isEmpty) {
      Get.snackbar("Error", "Harap isi semua field!");
      return;
    }

    homeController.updateList(
      index,
      titleC.text,
      descC.text,
      false, // Update tidak langsung selesai
      category,
      dueDate,
    );

    Get.back(); // kembali ke halaman sebelumnya
  }

  /// Hapus todo yang dipilih
  void deleteTodo() {
    if (index >= 0 && index < homeController.todoList.length) {
      homeController.deleteTodoAt(index);
      Get.back();
    } else {
      Get.snackbar("Error", "Todo tidak ditemukan!");
    }
  }

  @override
  void onClose() {
    titleC.dispose();
    descC.dispose();
    super.onClose();
  }
}
