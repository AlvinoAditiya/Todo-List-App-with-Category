import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app_with_category/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.put(HomeController(), permanent: true);

    void _showAddTodoDialog() {
      final TextEditingController _titleC = TextEditingController();
      final TextEditingController _descC = TextEditingController();
      String _selectedCategory = "Umum";

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text(
              "Tambah Todo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleC,
                    decoration: const InputDecoration(
                      hintText: "Judul",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.title),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _descC,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: "Deskripsi",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.description),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    items: ["Umum", "Pekerjaan", "Sekolah", "Pribadi"]
                        .map(
                          (cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(cat),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) _selectedCategory = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Kategori",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.category),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _titleC.dispose();
                  _descC.dispose();
                },
                child: const Text("Batal"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_titleC.text.trim().isEmpty ||
                      _descC.text.trim().isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Semua field harus diisi!",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  homeC.addTodo(
                    _titleC.text.trim(),
                    _descC.text.trim(),
                    _selectedCategory,
                    DateTime.now(),
                  );

                  _titleC.dispose();
                  _descC.dispose();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save),
                label: const Text("Simpan"),
              ),
            ],
          );
        },
      );
    }

    Widget _buildTodoCard(Map<String, dynamic> todo, int index) {
      String formattedDate = "";
      if (todo['date'] != null && todo['date'] is DateTime) {
        formattedDate = DateFormat("EEEE, dd MMM yyyy").format(todo['date']);
      } else if (todo['date'] != null) {
        formattedDate = todo['date'].toString();
      }

      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              todo['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  formattedDate,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 6),
                Chip(
                  label: Text(
                    todo['category'] ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
            trailing: Wrap(
              spacing: 4,
              children: [
                IconButton(
                  icon: const Icon(Icons.check_circle, color: Colors.green),
                  onPressed: () => homeC.markAsDone(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => homeC.deleteTodoAt(index),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      body: Obx(
        () => homeC.todoList.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada todo",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: homeC.todoList.length,
                itemBuilder: (context, index) =>
                    _buildTodoCard(homeC.todoList[index], index),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
