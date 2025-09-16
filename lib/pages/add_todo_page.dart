import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import 'todo_form.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TodoForm(
          onSave: (title, desc, category) {
            if (title.trim().isEmpty || desc.trim().isEmpty) {
              Get.snackbar(
                "Error",
                "Semua field harus diisi!",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
              );
              return;
            }
            homeC.addTodo(title, desc, category ?? "Umum", null);
            Get.back();
            Get.snackbar(
              "Berhasil",
              "Todo berhasil ditambahkan",
              snackPosition: SnackPosition.BOTTOM,
            );
          },
        ),
      ),
    );
  }
}
