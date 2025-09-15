import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app_with_category/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller dibuat permanent supaya tidak hilang saat pindah halaman
    final HomeController homeC = Get.put(HomeController(), permanent: true);

    void _showAddTodoDialog() {
      final TextEditingController _titleC = TextEditingController();
      final TextEditingController _descC = TextEditingController();
      String _selectedCategory = "Umum"; // default kategori

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text("Tambah Todo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleC,
                  decoration: const InputDecoration(
                    hintText: "Judul",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _descC,
                  decoration: const InputDecoration(
                    hintText: "Deskripsi",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
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
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
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
              ElevatedButton(
                onPressed: () {
                  if (_titleC.text.trim().isEmpty ||
                      _descC.text.trim().isEmpty) {
                    Get.snackbar("Error", "Semua field harus diisi!",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white);
                    return;
                  }

                  homeC.addTodo(
                    _titleC.text.trim(),
                    _descC.text.trim(),
                    _selectedCategory,
                    DateTime.now(), // ✅ tambahkan tanggal
                  );

                  _titleC.dispose();
                  _descC.dispose();
                  Navigator.pop(context);
                },
                child: const Text("Simpan"),
              ),
            ],
          );
        },
      );
    }

    Widget _buildTodoCard(Map<String, dynamic> todo, int index) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: ListTile(
          title: Text(todo['title'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(
            "${todo['category'] ?? ''}\n${todo['date'] ?? ''}", // ✅ tampilkan tanggal
          ),
          trailing: Wrap(
            spacing: 8,
            children: [
              IconButton(
                icon: const Icon(Icons.check, color: Colors.green),
                onPressed: () => homeC.markAsDone(index),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => homeC.deleteTodoAt(index),
              ),
            ],
          ),
          onTap: () {
            // Bisa ditambahkan navigasi ke halaman edit
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
