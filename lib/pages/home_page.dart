import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_todo_page.dart';

/// Reusable widget untuk satu item todo
class TodoCard extends StatelessWidget {
  final String title;
  final String category;
  final bool isDone;
  final VoidCallback? onDelete;
  final VoidCallback? onToggle;

  const TodoCard({
    super.key,
    required this.title,
    required this.category,
    this.isDone = false,
    this.onDelete,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: isDone ? Colors.green : null,
          ),
          onPressed: onToggle,
        ),
        title: Text(title),
        subtitle: Text("Kategori: $category"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

//onload

// === Penggunaan di HomePage ===
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // contoh dummy todo
    final todos = [
      {"title": "Belajar Flutter", "category": "Sekolah", "isDone": false},
      {"title": "Olahraga", "category": "Pribadi", "isDone": true},
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return TodoCard(
            title: todo["title"] as String,
            category: todo["category"] as String,
            isDone: todo["isDone"] as bool,
            onToggle: () {
              // toggle status done, nanti bisa hubungkan ke controller
              print("Toggled ${todo["title"]}");
            },
            onDelete: () {
              // delete todo, nanti bisa hubungkan ke controller
              print("Deleted ${todo["title"]}");
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddTodoPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
