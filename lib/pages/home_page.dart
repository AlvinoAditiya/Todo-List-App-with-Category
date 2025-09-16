import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/home_controller.dart';
import 'package:todo_list_app_with_category/widgets/custom_todo_card.dart';
import 'package:todo_list_app_with_category/widgets/custom_button.dart';
import 'package:todo_list_app_with_category/widgets/custom_textfield.dart';
import 'package:todo_list_app_with_category/widgets/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    // Dialog untuk tambah todo
    void _showAddTodoDialog() {
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
          onPressed: () {
            if (titleC.text.trim().isEmpty || descC.text.trim().isEmpty) {
              Get.snackbar(
                "Error",
                "Semua field harus diisi!",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColors.error,
                colorText: Colors.white,
              );
              return;
            }
            homeController.addTodo(
              titleC.text.trim(),
              descC.text.trim(),
              category,
              DateTime.now(),
            );
            Get.back();
          },
        ),
      );
    }

    return Scaffold(
      body: Obx(
        () => homeController.todoList.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada todo",
                  style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
                ),
              )
            : ListView.builder(
                itemCount: homeController.todoList.length,
                itemBuilder: (context, index) {
                  final todo = homeController.todoList[index];
                  return CustomTodoCard(
                    todo: todo,
                    onMarkAsDone: () => homeController.markAsDone(index),
                    onDelete: () => homeController.deleteTodoAt(index),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
