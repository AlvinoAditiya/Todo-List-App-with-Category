import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class TodoForm extends StatefulWidget {
  final void Function(String title, String desc, String? category) onSave;

  const TodoForm({super.key, required this.onSave});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  String? selectedCategory;
  final List<String> categories = ["Sekolah", "Pekerjaan", "Pribadi"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hint: "Judul", controller: titleC),
        const SizedBox(height: 16),
        CustomTextField(hint: "Deskripsi", controller: descC),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: selectedCategory,
          hint: const Text("Pilih Kategori"),
          items: categories
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) => setState(() => selectedCategory = value),
        ),
        const SizedBox(height: 30),
        CustomButton(
          text: "Simpan",
          onPressed: () {
            widget.onSave(titleC.text, descC.text, selectedCategory);
          },
        ),
      ],
    );
  }
}
