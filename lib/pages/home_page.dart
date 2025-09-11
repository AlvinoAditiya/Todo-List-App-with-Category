import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> todos = ["Belajar Flutter", "Kerjakan Tugas"];
  final TextEditingController _todoController = TextEditingController();

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text("Tambah Todo"),
          content: TextField(
            controller: _todoController,
            decoration: const InputDecoration(
              hintText: "Masukkan judul todo",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _todoController.clear();
              },
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_todoController.text.trim().isNotEmpty) {
                  setState(() {
                    todos.add(_todoController.text.trim());
                  });
                  _todoController.clear();
                  Navigator.pop(context);
                }
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  void _deleteTodoAt(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: todos.isEmpty
          ? const Center(
              child: Text(
                "Belum ada todo",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    title: Text(
                      todos[index],
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteTodoAt(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog, // ganti jadi dialog
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
