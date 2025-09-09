import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // contoh dummy todo
          Card(
            child: ListTile(
              leading: const Icon(Icons.check_box_outline_blank),
              title: const Text("Belajar Flutter"),
              subtitle: const Text("Kategori: Sekolah"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.check_box, color: Colors.green),
              title: const Text("Olahraga"),
              subtitle: const Text("Kategori: Pribadi"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),

      // Tombol tambah todo
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddTodoPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
