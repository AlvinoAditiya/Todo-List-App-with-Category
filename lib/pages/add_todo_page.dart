import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/home_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/app_colors.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final titleC = TextEditingController();
    final descC = TextEditingController();
    final categories = ["Sekolah", "Pekerjaan", "Pribadi"];
    String selectedCategory = categories[0]; // default category

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Todo"),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(hint: "Judul", controller: titleC),
            const SizedBox(height: 16),
            CustomTextField(hint: "Deskripsi", controller: descC),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                if (value != null) selectedCategory = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.secondary),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "Simpan",
              onPressed: () {
                homeController.addTodo(
                  titleC.text.trim(),
                  descC.text.trim(),
                  selectedCategory,
                  DateTime.now(),
                );
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}