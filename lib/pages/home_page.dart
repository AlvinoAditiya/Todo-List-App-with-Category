import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import 'history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.put(HomeController());

    void _showAddTodoDialog() {
      final TextEditingController titleC = TextEditingController();
      final TextEditingController descC = TextEditingController();
      String category = "Umum";

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text("Tambah Todo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleC,
                decoration: const InputDecoration(
                  hintText: "Judul",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descC,
                decoration: const InputDecoration(
                  hintText: "Deskripsi",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: category,
                items: ["Umum", "Pekerjaan", "Sekolah", "Pribadi"]
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => category = v ?? "Umum",
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                titleC.dispose();
                descC.dispose();
              },
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleC.text.trim().isEmpty || descC.text.trim().isEmpty) {
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
                  titleC.text.trim(),
                  descC.text.trim(),
                  category,
                  null,
                );
                titleC.dispose();
                descC.dispose();
                Navigator.pop(context);
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      );
    }

    Widget todoCard(Map<String, dynamic> todo, int index) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: ListTile(
          title: Text(
            todo['title'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(todo['category'] ?? ''),
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
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Get.to(() => const HistoryPage()),
          ),
        ],
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
                itemBuilder: (_, i) => todoCard(homeC.todoList[i], i),
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
