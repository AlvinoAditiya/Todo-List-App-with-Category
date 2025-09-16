import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/app_colors.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  String? selectedCategory;
  final List<String> categories = ["Sekolah", "Pekerjaan", "Pribadi"];

  @override
  Widget build(BuildContext context) {
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
              hint: const Text("Pilih Kategori"),
              items: categories.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.secondary),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "Simpan",
              onPressed: () {
                Get.back();
                Get.snackbar(
                  "Berhasil",
                  "Todo berhasil ditambahkan (dummy)",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: AppColors.success,
                  colorText: Colors.white,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}